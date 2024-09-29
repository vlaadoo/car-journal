// ignore_for_file: prefer_const_constructors

import 'package:car_journal/core/common/widgets/loader.dart';
import 'package:car_journal/core/utils/show_alert.dart';
import 'package:car_journal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:car_journal/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'dart:developer' as devtools;

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    devtools.log("Failure");
                    showToast(
                      context: context,
                      message: "Logout failed: ${state.message}",
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Loader();
                  }
                  return Column(
                    children: [
                      Text("Home Page"),
                      ShadButton(
                        onPressed: () {
                          serviceLocator<AuthBloc>().add(AuthLogout());
                        },
                        child: Text("Logout"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
