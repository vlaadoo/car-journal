// ignore_for_file: prefer_const_constructors

import 'package:car_journal/features/auth/presentation/pages/signup_page.dart';
import 'package:car_journal/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // formKey.currentState?.validate();
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                      "Вход",
                      style: ShadTheme.of(context).textTheme.lead.copyWith(
                            color: ShadTheme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                            fontSize:
                                ShadTheme.of(context).textTheme.h3.fontSize,
                          ),
                    ),
                    SizedBox(height: 16.0),
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
                        "Войти",
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () => Navigator.push(context, SignUpPage.route()),
                      child: RichText(
                        text: TextSpan(
                          text: "Еще нет аккаунта?  ",
                          style: ShadTheme.of(context).textTheme.small.copyWith(
                                color:
                                    ShadTheme.of(context).textTheme.muted.color,
                                fontWeight: FontWeight.w400,
                              ),
                          children: [
                            TextSpan(
                              text: "Создать",
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
      ),
    );
  }
}
