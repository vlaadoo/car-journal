import 'package:car_journal/constants/routes.dart';
import 'package:car_journal/services/auth/auth_exceptions.dart';
import 'package:car_journal/services/auth/auth_service.dart';
import 'package:car_journal/utilities/show_error_dialog.dart';
import 'package:flutter/material.dart';

// TODO cleanup (https://youtu.be/VPvVD8t02U8?t=58455)
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Войти"),
      ),
      body: Column(children: [
        TextField(
          controller: _email,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: "Введите ваш e-mail"),
        ),
        TextField(
          controller: _password,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: const InputDecoration(hintText: "Введите ваш пароль"),
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;
            try {
              await AuthService.firebase().logIn(
                email: email,
                password: password,
              );
              final user = AuthService.firebase().currentUser;
              if (user?.isEmailVerified ?? false) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  journalRoute,
                  (route) => false,
                );
              } else {
                // Navigator.of(context).pushNamedAndRemoveUntil(verify, (route) => false)
              }
            } on UserNotFoundAuthException {
              if (!context.mounted) return;

              await showErrorDialog(
                context,
                'Пользователь не найден',
              );
            } on WrongPasswordAuthException {
              if (!context.mounted) return;

              await showErrorDialog(
                context,
                'Неверная почта или пароль.',
              );
            } on GenericAuthException {
              if (!context.mounted) return;

              await showErrorDialog(
                context,
                'Ошибка входа',
              );
            }
          },
          child: const Text("Войти"),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text("Нет аккаунта?"))
      ]),
    );
  }
}
