import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  final TextInputType textType;
  final TextEditingController controller;

  const AuthField({
    super.key,
    required this.hintText,
    this.isObscure = false,
    required this.textType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      autocorrect: false,
      controller: controller,
      keyboardType: textType,
      obscureText: isObscure,
      placeholder: Text(hintText),
      validator: (value) {
        if (value.isEmpty) {
          return "$hintText не может быть пустым";
        }
        return null;
      },
    );
  }
}
