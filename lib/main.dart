// ignore_for_file: unused_import
import 'package:car_journal/firebase_options.dart';
import 'package:car_journal/pages/home_view.dart';
import 'package:car_journal/pages/login_view.dart';
import 'package:car_journal/pages/register_view.dart';
import 'package:car_journal/pages/verify_email_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: 'CarJorunal',
    theme: ThemeData(primarySwatch: Colors.green),
    debugShowCheckedModeBanner: false,
    // home: const HomePage(title: 'Test Homepage',),
    home: const HomePage(),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            //   final user = FirebaseAuth.instance.currentUser;
            //   if (user?.emailVerified ?? false) {
            //     return const LoginView();
            //   } else {
            //     return const VerifyEmailView();
            //   }
            return const LoginView();
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
