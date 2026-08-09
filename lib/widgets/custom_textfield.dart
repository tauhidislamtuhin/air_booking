import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? value;
  final VoidCallback? onTap;
  final double? fontSize;

  const CustomTextField({
    super.key,
    required this.title,
    required this.icon,
    this.value,
    this.onTap,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = CustomColors.getTextColor(context);
    final subTextColor = CustomColors.getSubTextColor(context);
    final borderColor = CustomColors.getBorderColor(context);

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(color: subTextColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.transparent,
          prefixIcon: Icon(
            icon,
            color: textColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: CustomColors.primaryColor,
              width: 1.5,
            ),
          ),
        ),
        child: Text(
          value?.isEmpty ?? true ? "Select" : value!,
          style: TextStyle(
            fontSize: fontSize ?? 16,
            color: value?.isEmpty ?? true ? subTextColor : textColor,
          ),
        ),
      ),
    );
  }
}