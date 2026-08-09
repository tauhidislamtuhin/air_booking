import 'package:air_booking/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class SortFilterBar extends StatelessWidget {
  final VoidCallback? onSort;
  final VoidCallback? onFilter;

  const SortFilterBar({
    super.key,
    this.onSort,
    this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    final cardBg = CustomColors.getCardColor(context);
    final textColor = CustomColors.getTextColor(context);
    final dividerColor = CustomColors.getBorderColor(context);

    return Center(
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(18),
        color: cardBg,
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: cardBg,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: onSort,
                child: Row(
                  children: [
                    Icon(Icons.swap_vert_rounded, color: textColor),
                    const SizedBox(width: 8),
                    Text(
                      "Sort",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                width: 1,
                height: 26,
                color: dividerColor,
              ),

              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: onFilter,
                child: Row(
                  children: [
                    Icon(Icons.tune_rounded, color: textColor),
                    const SizedBox(width: 8),
                    Text(
                      "Filter",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}