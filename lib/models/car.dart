class Car {
  final int id;
  final int userId;
  final String carTitle;
  final String carNumber;
  final String carMileage;

  Car({
    required this.id,
    required this.userId,
    required this.carTitle,
    required this.carNumber,
    required this.carMileage,
  });

  factory Car.fromJson(Map<String, Object?> json) {
    return Car(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      carTitle: json['car_title'] as String,
      carNumber: json['car_number'] as String,
      carMileage: json['car_mileage'] as String,
    );
  }
}
