import 'package:car_journal/.old/theme/app_theme.dart';
import 'package:car_journal/.old/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPasswordView extends StatefulWidget {
  const EditPasswordView({
    super.key,
  });

  @override
  State<EditPasswordView> createState() => _EditPasswordViewState();
}

class _EditPasswordViewState extends State<EditPasswordView> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    final carNameController = TextEditingController();
    final carPlateController = TextEditingController();
    final carRangeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Изменить пароль"),
      ),
      backgroundColor: themeProvider.themeMode().backgroundPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              CustomTextField(
                controller: carNameController,
                hintText: 'Старый пароль',
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: carPlateController,
                hintText: 'Новый пароль',
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: carRangeController,
                hintText: 'Повторите пароль',
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor:
                      themeProvider.themeMode().backgroundSecondary,
                ),
                onPressed: () {},
                child: Text(
                  "Изменить пароль",
                  style: TextStyle(
                    color: themeProvider.themeMode().textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final bool obscureText;
//   final TextInputType keyboardType;
//   final inputFormat;

//   const MyTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     required this.obscureText,
//     required this.keyboardType,
//     this.inputFormat,
//   });

//   @override
//   Widget build(BuildContext context) {
//     ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         keyboardType: keyboardType,
//         inputFormatters: <TextInputFormatter>[
//           inputFormat ?? FilteringTextInputFormatter.singleLineFormatter
//         ],
//         decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//               borderSide:
//                   BorderSide(color: themeProvider.themeMode().additional1),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide:
//                   BorderSide(color: themeProvider.themeMode().accentColor),
//             ),
//             fillColor: themeProvider.themeMode().backgroundSecondary,
//             filled: true,
//             hintText: hintText,
//             hintStyle: TextStyle(color: themeProvider.themeMode().additional1)),
//       ),
//     );
//   }
// }
