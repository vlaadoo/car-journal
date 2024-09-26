import 'package:car_journal/.old/constants/constants.dart';
import 'package:car_journal/.old/constants/routes.dart';
import 'package:car_journal/.old/pages/journal/main_view.dart';
import 'package:car_journal/.old/pages/login_view.dart';
import 'package:car_journal/.old/pages/journal/add_edit_car_view.dart';
import 'package:car_journal/.old/pages/register_view.dart';
import 'package:car_journal/.old/pages/verify_email_view.dart';
import 'package:car_journal/.old/services/auth/auth_service.dart';
import 'package:car_journal/.old/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLightMode = prefs.getBool(SPref.isLight) ?? true;
  runApp(AppStart(
    isLightMode: isLightMode,
  ));
}

class AppStart extends StatelessWidget {
  const AppStart({super.key, required this.isLightMode});
  final bool isLightMode;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isLightMode: isLightMode),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'CarJournal',
      theme: themeProvider.themeData(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        journalRoute: (context) => const MainView(),
        emailVerifyRoute: (context) => const VerifyEmailView(),
        addEditCarRoute: (context) => AddEditCarView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                devtools.log("Email is verified");
                devtools.log("ID: ${user.id}");
                devtools.log("restarted");
                return const MainView();
                // return ShowAllExpensesView();
                // return const OnboardingView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const SafeArea(
              child: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
        }
      },
    );
  }
}
