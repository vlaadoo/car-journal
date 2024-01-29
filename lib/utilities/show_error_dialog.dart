import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String errorText,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Возникла ошибка"),
        content: Text(errorText),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ок'))
        ],
      );
    },
  );
}
