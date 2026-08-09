import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

class PriceRow extends StatelessWidget {
  final String title;
  final String amount;
  final bool isTotal;

  const PriceRow({
    super.key,
    required this.title,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = CustomColors.getTextColor(context);
    final subTextColor = CustomColors.getSubTextColor(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //label
          Text(
            title,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? textColor : subTextColor,
            ),
          ),

          // value
          Text(
            amount,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
              color: isTotal ? CustomColors.primaryColor : textColor,
            ),
          ),
        ],
      ),
    );
  }
}