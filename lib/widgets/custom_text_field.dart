import 'package:car_journal/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController _controller;
  final String _hintText;
  final bool _obscureText;
  final TextInputType _keyboardType;
  final TextInputFormatter? _inputFormat;
  final ValueChanged<String?>? _valueChanged;

  const CustomTextField({
    super.key,
    required TextEditingController controller,
    required String hintText,
    required bool obscureText,
    required TextInputType keyboardType,
    TextInputFormatter? inputFormat,
    ValueChanged<String?>? valueChanged,
  })  : _inputFormat = inputFormat,
        _keyboardType = keyboardType,
        _obscureText = obscureText,
        _hintText = hintText,
        _controller = controller,
        _valueChanged = valueChanged;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          controller: _controller,
          obscureText: _obscureText,
          keyboardType: _keyboardType,
          inputFormatters: <TextInputFormatter>[
            _inputFormat ?? FilteringTextInputFormatter.singleLineFormatter
          ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            labelText: _hintText,
            labelStyle: TextStyle(
              color: themeProvider.themeMode().additional1,
              fontWeight: FontWeight.w500,
            ),
            floatingLabelStyle: TextStyle(
                color: themeProvider.themeMode().additional2,
                fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeProvider.themeMode().backgroundSecondary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeProvider.themeMode().accentColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: themeProvider.themeMode().backgroundSecondary,
          ),
          onChanged: _valueChanged,
        ),
      ),
    );
  }
}
