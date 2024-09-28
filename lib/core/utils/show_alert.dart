// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void showToast({
  required BuildContext context,
  required String message,
}) {
  ShadToaster.of(context).show(
    ShadToast.destructive(
      animateOut: [
        SlideEffect(
          begin: Offset.zero,
          end: Offset(0, 1),
          duration: const Duration(milliseconds: 1000),
        )
      ],
      description: Text(message),
      duration: const Duration(seconds: 3),
    ),
  );
}
