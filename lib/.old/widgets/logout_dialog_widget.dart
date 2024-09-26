import 'package:car_journal/.old/constants/routes.dart';
import 'package:car_journal/.old/services/auth/auth_service.dart';
import 'package:car_journal/.old/theme/app_theme.dart';
import 'package:flutter/material.dart';

Future<bool> showLogOutDialod(
    BuildContext context, ThemeProvider themeProvider) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: themeProvider.themeMode().backgroundPrimary,
        title: const Text("Выход"),
        content: const Text("Вы уверены что хотите выйти?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              'Отмена',
              style: TextStyle(
                color: themeProvider.themeMode().additional2,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              AuthService.firebase().logOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            child: Text(
              'Выйти',
              style: TextStyle(
                color: themeProvider.themeMode().textColor,
              ),
            ),
          )
        ],
      );
    },
  ).then(((value) => value ?? false));
}
