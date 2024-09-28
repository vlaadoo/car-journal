import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.6,
      ),
      child: const ShadProgress(),
    );
  }
}
