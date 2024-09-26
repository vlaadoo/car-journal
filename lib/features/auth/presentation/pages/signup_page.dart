// ignore_for_file: prefer_const_constructors

import 'package:car_journal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:car_journal/features/auth/presentation/pages/login_page.dart';
import 'package:car_journal/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      );
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // formKey.currentState?.validate();
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Регистрация",
                        style: ShadTheme.of(context).textTheme.lead.copyWith(
                              color: ShadTheme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  ShadTheme.of(context).textTheme.h3.fontSize,
                            ),
                      ),
                      SizedBox(height: 16.0),
                      AuthField(
                        hintText: "Имя",
                        textType: TextInputType.text,
                        controller: nameController,
                      ),
                      SizedBox(height: 8.0),
                      AuthField(
                        hintText: "Email",
                        textType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      SizedBox(height: 8.0),
                      AuthField(
                        hintText: "Пароль",
                        isObscure: true,
                        textType: TextInputType.text,
                        controller: passwordController,
                      ),
                      SizedBox(height: 8.0),
                      ShadButton(
                        width: double.infinity,
                        child: Text(
                          "Зарегистрироваться",
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthSignUp(
                                    email: emailController.text.trim(),
                                    name: nameController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                          }
                        },
                      ),
                      SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            LoginPage.route(),
                            (route) => false,
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Уже есть аккаунт?  ",
                            style:
                                ShadTheme.of(context).textTheme.small.copyWith(
                                      color: ShadTheme.of(context)
                                          .textTheme
                                          .muted
                                          .color,
                                      fontWeight: FontWeight.w400,
                                    ),
                            children: [
                              TextSpan(
                                text: "Войти",
                                style: ShadTheme.of(context)
                                    .textTheme
                                    .small
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
