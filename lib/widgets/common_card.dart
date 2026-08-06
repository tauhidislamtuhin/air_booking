import 'package:flutter/material.dart';

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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: customRow??[
              if (icon != null) ...[
                Icon(icon, size: 22, color: Colors.black87),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  title??"",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),

          const SizedBox(height: 10),
          Divider(color: Colors.grey.shade200, height: 1),
          const SizedBox(height: 10),
          child,

          if (footer != null) ...[
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade200, height: 1),
            const SizedBox(height: 10),
            footer!,
          ],
        ],
      ),
    );
  }



}