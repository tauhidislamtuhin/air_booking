import 'package:flutter/material.dart';
import '../../utils/custom_colors.dart';

class AppTheme {
  static final ValueNotifier<ThemeMode> themeModeNotifier =
  ValueNotifier(ThemeMode.light);

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: CustomColors.backgroundColor,
      cardColor: CustomColors.secondaryColor,
      primaryColor: CustomColors.primaryColor,
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: CustomColors.darkBackgroundColor,
      cardColor: CustomColors.darkCardColor,
      primaryColor: CustomColors.primaryColor,
      useMaterial3: true,
    );
  }
}