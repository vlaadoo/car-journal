// import 'package:firebase_auth/firebase_auth.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:developer' as devtools show log;

class SQLConnector {
  late MySqlConnection conn;

  final String _host = '10.5.1.12';
  final int _port = 3306;
  final String _db = 'carjournal';
  final String _user = 'carjournal';
  final String _passwd = 'Pa\$\$w0rd';

  Future<MySqlConnection> open() async {
    var settings = ConnectionSettings(
      host: _host,
      port: _port,
      user: _user,
      password: _passwd,
      db: _db,
    );
    try {
      final conn = await MySqlConnection.connect(settings);
      await Future.delayed(const Duration(milliseconds: 100));
      return conn;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

// Getters from database

  Future<List<Map>> getCars(String userId) async {
    devtools.log("in getcars");
    List<Map> cars = [];
    var conn = await open();
    Results results =
        await conn.query('select * from car where user_id = ?', [userId]);
    conn.close();
    for (var row in results) {
      cars.add({
        'id': row[0],
        'user_id': row[1],
        'car title': row[2],
        'car number': row[3],
        'car mileage': row[4].toString(),
      });
    }
    return cars.toList();
  }

  Future<List<Map>> getNameAndSurname(String userId) async {
    List<Map> names = [];
    var conn = await open();
    Results results = await conn
        .query("select name, surname, email from user where id = ?", [userId]);
    conn.close();
    for (var row in results) {
      names.add({
        'name': row[0],
        'surname': row[1],
        'email': row[2],
      });
    }
    return names;
  }

  // Inserts to database

  Future<void> addCarToGarage(
      String userId, String carTitle, String carPlate, int carRange) async {
    var conn = await open();
    String queryString =
        "INSERT INTO car (user_id, car_title, car_number, car_mileage) VALUES ('$userId', '$carTitle', '$carPlate', '$carRange')";
    try {
      await conn.query(queryString);
    } catch (e) {
      throw Exception(e);
    }
  }
}

void main() async {
  List<Map> map = await SQLConnector().getCars("userId");
  print(map);
}
