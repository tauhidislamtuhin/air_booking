import 'package:flutter/material.dart';

class CustomColors {

  static Color primaryColor = const Color(0XFF235DFF);
  static Color backgroundColor = const Color(0XFFF5F5F5);
  static Color secondaryColor = const Color(0XFFFFFFFF);


  static Color darkBackgroundColor = const Color(0XFF121212);
  static Color darkCardColor = const Color(0XFF1E1E1E);

  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackgroundColor
        : backgroundColor;
  }

  static Color getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkCardColor
        : secondaryColor;
  }

  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black87;
  }

  static Color getSubTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade400
        : Colors.black54;
  }

  static Color getBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade800
        : Colors.grey.shade300;
  }
}