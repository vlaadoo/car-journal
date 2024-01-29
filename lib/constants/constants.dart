import 'dart:ui';

class AppColors {}

class SPref {
  static const String isLight = "isLight";
}

class ThemeColors {
  Color backgroundPrimary;
  Color backgroundSecondary;
  Color backgroundTertiary;
  Color accentColor;
  Color textColor;
  Color additional1;
  Color additional2;
  Color additional3;
  Color transparent;

  ThemeColors({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.accentColor,
    required this.textColor,
    required this.additional1,
    required this.additional2,
    required this.additional3,
    required this.transparent,
  });
}
