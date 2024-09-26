// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:car_journal/.old/services/database/sql_connector.dart';
import 'package:car_journal/.old/theme/app_theme.dart';
import 'package:car_journal/.old/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddEditCarView extends StatefulWidget {
  String? userId;
  Map? car;
  AddEditCarView({super.key, this.userId, this.car});

  @override
  State<AddEditCarView> createState() => _AddEditCarViewState();
}

class _AddEditCarViewState extends State<AddEditCarView> {
  final _mysql = SQLConnector();

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    final carNameController =
        TextEditingController(text: widget.car?['car title']);
    final carPlateController =
        TextEditingController(text: widget.car?['car number']);
    final carRangeController =
        TextEditingController(text: widget.car?['car mileage']);

    print(widget.userId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.car != null ? "Изменить автомобиль" : "Добавить автомобиль"),
      ),
      backgroundColor: themeProvider.themeMode().backgroundPrimary,
      body: Hero(
        tag: "addCarTag",
        child: Material(
          type: MaterialType.transparency,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: carNameController,
                    hintText: 'Название автомобиля',
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: carPlateController,
                    hintText: 'Номер автомобиля',
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: carRangeController,
                    hintText: 'Пробег',
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormat: FilteringTextInputFormatter.digitsOnly,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: themeProvider.themeMode().accentColor,
                    ),
                    onPressed: () async {
                      await _mysql.addCarToGarage(
                        widget.userId!.toString(),
                        carNameController.text,
                        carPlateController.text,
                        int.parse(carRangeController.text),
                      );
                    },
                    child: Text(
                      "Добавить",
                      style: TextStyle(
                        color: themeProvider.themeMode().textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
