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
    return CommonCard(
      customRow: isCustomRow
          ? [
        Image.asset(
          'assets/images/airplane.png',
          width: 42,
          height: 42,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "Original",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
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
                  const TextSpan(
                    text: " /pax",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ] : null,

      title: title,
      icon: icon,
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.fastfood_outlined, size: 18, color: Colors.black54),
              SizedBox(width: 10),
              Icon(Icons.tv_outlined, size: 18, color: Colors.black54),
              SizedBox(width: 10),
              Icon(Icons.wifi, size: 18, color: Colors.black54),
              SizedBox(width: 10),
              Icon(Icons.power_outlined, size: 18, color: Colors.black54),
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
      child: Column(
        children: [
          featureRow(Icons.shopping_bag_outlined, "Cabin Baggage 1 x 7 kg"),
          featureRow(Icons.business_center_outlined, "Baggage 1 x 20 kg"),
          featureRow(Icons.calendar_today_outlined, "Reschedule Available"),
          featureRow(Icons.monetization_on_outlined, "Refundable"),
          featureRow(Icons.verified_user_outlined, "Travel Insurance Included"),
        ],
      ),
    );
  }
}