// ignore_for_file: prefer_const_constructors

import 'package:car_journal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:car_journal/features/auth/presentation/pages/login_page.dart';
import 'package:car_journal/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ShadThemeData(
          brightness: Brightness.light,
          colorScheme: ShadNeutralColorScheme.light(),
        ),
        darkTheme: ShadThemeData(
          brightness: Brightness.dark,
          colorScheme: ShadNeutralColorScheme.dark(),
        ),
        home: LoginPage());
  }
}
