import 'package:car_journal/constants/routes.dart';
import 'package:car_journal/firebase_options.dart';
import 'package:car_journal/utilities/show_error_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// TODO cleanup (https://youtu.be/VPvVD8t02U8?t=58740)

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          title: const Text("Регистрация"),
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
              await Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              );
              final email = _email.text;
              final password = _password.text;
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (!context.mounted) return;
                // TODO отправка подтверждения до перехода на страницу (https://youtu.be/VPvVD8t02U8?t=52285)
                Navigator.of(context).pushNamed(emailVerifyRoute);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  if (!context.mounted) return;
                  showErrorDialog(context, "Слабый пароль");
                } else if (e.code == 'email-already-in-use') {
                  if (!context.mounted) return;
                  showErrorDialog(context, "Данная почта уже используется");
                }
                //TODO сделать другие ошибки
              }
            },
            child: const Text("Создать аккаунт"),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text("Уже есть аккаунт?"))
        ]));
  }
}
