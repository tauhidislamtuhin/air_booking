import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/custom_colors.dart';

class CommonHeader extends StatelessWidget {
  final double height;
  final Widget? child;

  const CommonHeader({
    super.key,
    this.height = 300,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:  SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // Android
        statusBarBrightness: Brightness.dark,     // iOS
      ),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.primaryColor,
              CustomColors.primaryColor.withAlpha(210),
            ],
          ),
          image: const DecorationImage(
            image: AssetImage("assets/images/dots_pattern.png"),
            fit: BoxFit.cover,
            opacity: 0.12,
          ),
        ),
        child: child,
      ),
    );
  }
}