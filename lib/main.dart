// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:car_journal/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:car_journal/features/auth/carjournal/homepage.dart';
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
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    serviceLocator<AuthBloc>().add(AuthCheck());
  }

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
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return HomePage();
          }
          return LoginPage();
        },
      ),
    );
  }
}
