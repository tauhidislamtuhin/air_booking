import 'package:flutter/material.dart';
import '../models/flight.dart';
import '../utils/custom_colors.dart';
import '../utils/featureRow.dart';
import 'common_card.dart';

class FlightInfoCard extends StatelessWidget {
  final Flight flight;
  final bool isCustomRow;
  final String? title;
  final IconData? icon;
  final VoidCallback? onDetailsTap;

  const FlightInfoCard({
    super.key,
    required this.flight,
    this.isCustomRow = true,
    this.title,
    this.icon,
    this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = CustomColors.getTextColor(context);
    final subTextColor = CustomColors.getSubTextColor(context);

    return CommonCard(
      // Custom header row layout
      customRow: isCustomRow
          ? [
        Image.asset(
          'assets/images/airplane.png',
          width: 42,
          height: 42,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) => const SizedBox(width: 42, height: 42),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "Original",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: flight.price,
                    style: TextStyle(
                      color: CustomColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " /pax",
                    style: TextStyle(
                      color: subTextColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]
          : null,

      title: title,
      icon: icon,

      // Footer section with icons and details button
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.fastfood_outlined, size: 18, color: subTextColor),
              const SizedBox(width: 10),
              Icon(Icons.tv_outlined, size: 18, color: subTextColor),
              const SizedBox(width: 10),
              Icon(Icons.wifi, size: 18, color: subTextColor),
              const SizedBox(width: 10),
              Icon(Icons.power_outlined, size: 18, color: subTextColor),
            ],
          ),
          InkWell(
            onTap: onDetailsTap ?? () {},
            child: Row(
              children: [
                Text(
                  "Details",
                  style: TextStyle(
                    color: CustomColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: CustomColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),

      // List of flight features
      child: Column(
        children: [
          featureRow(context, Icons.shopping_bag_outlined, "Cabin Baggage 1 x 7 kg"),
          featureRow(context, Icons.business_center_outlined, "Baggage 1 x 20 kg"),
          featureRow(context, Icons.calendar_today_outlined, "Reschedule Available"),
          featureRow(context, Icons.monetization_on_outlined, "Refundable"),
          featureRow(context, Icons.verified_user_outlined, "Travel Insurance Included"),
        ],
      ),
    );
  }
}