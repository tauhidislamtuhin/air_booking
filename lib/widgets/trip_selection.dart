import 'package:air_booking/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class TripSelection extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const TripSelection({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cardBg = CustomColors.getCardColor(context);
    final textColor = CustomColors.getTextColor(context);
    final borderColor = CustomColors.getBorderColor(context);

    return Row(
      children: [
        _buildChip(
          context: context,
          label: "One-Way",
          index: 0,
          cardBg: cardBg,
          textColor: textColor,
          borderColor: borderColor,
        ),
        const SizedBox(width: 4),
        _buildChip(
          context: context,
          label: "Round Trip",
          index: 1,
          cardBg: cardBg,
          textColor: textColor,
          borderColor: borderColor,
          fontSize: 11,
        ),
        const SizedBox(width: 4),
        _buildChip(
          context: context,
          label: "Multi-City",
          index: 2,
          cardBg: cardBg,
          textColor: textColor,
          borderColor: borderColor,
        ),
      ],
    );
  }

  Widget _buildChip({
    required BuildContext context,
    required String label,
    required int index,
    required Color cardBg,
    required Color textColor,
    required Color borderColor,
    double fontSize = 12,
  }) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: ChoiceChip(
        label: Text(label, overflow: TextOverflow.visible),
        selected: isSelected,
        onSelected: (_) => onChanged(index),
        selectedColor: CustomColors.primaryColor,
        backgroundColor: cardBg,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : textColor,
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ),
        side: BorderSide(
          color: isSelected ? CustomColors.primaryColor : borderColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        showCheckmark: false,
      ),
    );
  }
}