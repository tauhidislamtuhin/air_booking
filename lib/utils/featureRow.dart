import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

Widget featureRow(BuildContext context, IconData icon, String text) {
  final textColor = CustomColors.getTextColor(context);
  final subTextColor = CustomColors.getSubTextColor(context);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: subTextColor,
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}