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
    return Row(
      children: [
        Expanded(
          child: ChoiceChip(
            label: const Text(
              "One-Way",
              overflow: TextOverflow.visible,
            ),
            selected: selectedIndex == 0,
            onSelected: (_) => onChanged(0),
            selectedColor: CustomColors.primaryColor,
            backgroundColor: CustomColors.secondaryColor,
            labelStyle: TextStyle(
              color: selectedIndex == 0
                  ? Colors.white
                  : Colors.black87,
              fontWeight: FontWeight.w600,
                fontSize: 12
            ),

            side: BorderSide(
              color: Colors.grey.shade300,
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),

            showCheckmark: false,
          ),
        ),

        const SizedBox(width: 2),

        Expanded(
          child: ChoiceChip(
            label: const Text("Round Trip"),
            selected: selectedIndex == 1,
            onSelected: (_) => onChanged(1),

            selectedColor: CustomColors.primaryColor,
            backgroundColor: CustomColors.secondaryColor,
            labelStyle: TextStyle(
              color: selectedIndex == 1
                  ? Colors.white
                  : Colors.black87,
              fontWeight: FontWeight.w600,
                fontSize: 11
            ),

            side: BorderSide(
              color: Colors.grey.shade300,
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),

            showCheckmark: false,
          ),
        ),

        const SizedBox(width: 2),

        Expanded(
          child: ChoiceChip(
            label: const Text("Multi-City"),

            selected: selectedIndex == 2,
            onSelected: (_) => onChanged(2),
            selectedColor: CustomColors.primaryColor,
            backgroundColor: CustomColors.secondaryColor,

            labelStyle: TextStyle(
              color: selectedIndex == 2
                  ? Colors.white
                  : Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 12
            ),

            side: BorderSide(
              color: Colors.grey.shade300,
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),

            showCheckmark: false,
          ),
        ),
      ],
    );
  }
}