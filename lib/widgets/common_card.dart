import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

class CommonCard extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final Widget? trailing;
  final Widget child;
  final Widget? footer;
  final List<Widget>? customRow;

  const CommonCard({
    super.key,
    this.icon,
    this.title,
    this.trailing,
    required this.child,
    this.footer,
    this.customRow,
  });

  @override
  Widget build(BuildContext context) {
    final cardBg = CustomColors.getCardColor(context);
    final textColor = CustomColors.getTextColor(context);
    final dividerColor = CustomColors.getBorderColor(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: dividerColor),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withAlpha(50)
                : Colors.black.withAlpha(8),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section
          Row(
            children: customRow ?? [
              if (icon != null) ...[
                Icon(icon, size: 22, color: textColor),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  title ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
              ?trailing,
            ],
          ),

          const SizedBox(height: 10),
          Divider(color: dividerColor, height: 1),
          const SizedBox(height: 10),

          // Main content
          child,

          // Optional footer section
          if (footer != null) ...[
            const SizedBox(height: 10),
            Divider(color: dividerColor, height: 1),
            const SizedBox(height: 10),
            footer!,
          ],
        ],
      ),
    );
  }
}