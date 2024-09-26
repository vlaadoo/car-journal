import 'package:car_journal/.old/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool isLightMode;
  ThemeProvider({required this.isLightMode});

  getCurrentStatusNavigationBarColor() {
    if (isLightMode) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xFF212121),
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    }
  }

  toggleThemeData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isLightMode) {
      sharedPreferences.setBool(SPref.isLight, false);
      isLightMode = !isLightMode;
      notifyListeners();
    } else {
      sharedPreferences.setBool(SPref.isLight, true);
      isLightMode = !isLightMode;
      notifyListeners();
    }
  }

  ThemeData themeData() {
    return ThemeData(
      brightness: isLightMode ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor:
          isLightMode ? const Color(0xFFFAFAFA) : const Color(0xFF212121),
      // colorScheme:
    );
  }

  ThemeColors themeMode() {
    if (isLightMode) {
      return lightM;
    } else {
      return darkM;
    }
  }
}

ThemeColors lightM = ThemeColors(
  backgroundPrimary: const Color(0xFF212121),
  backgroundSecondary: const Color(0xFF313131),
  backgroundTertiary: const Color(0xFF414141),
  accentColor: const Color(0xFF0AB051),
  textColor: const Color(0xFFFAFAFA),
  additional1: const Color(0xFF666666),
  additional2: const Color(0xFFBBBBBB),
  additional3: const Color(0xFF999999),
  transparent: Colors.transparent,
);

ThemeColors darkM = ThemeColors(
  backgroundPrimary: const Color(0xFF212121),
  backgroundSecondary: const Color(0xFF313131),
  backgroundTertiary: const Color(0xFF414141),
  accentColor: const Color(0xFF0AB051),
  textColor: const Color(0xFFFAFAFA),
  additional1: const Color(0xFF666666),
  additional2: const Color(0xFFBBBBBB),
  additional3: const Color(0xFF999999),
  transparent: Colors.transparent,
);
