import 'package:flutter/material.dart';
import '../models/flight.dart';
import '../utils/custom_colors.dart';
import 'common_card.dart';
import 'price_row.dart';

class PriceDetailsCard extends StatelessWidget {
  final Flight flight;
  final int passengerCount;
  final double insuranceFee;
  final double taxAmount;
  final double pointsDiscount;
  final double discountPercentage;
  final bool? isFinal;

  const PriceDetailsCard({
    super.key,
    required this.flight,
    this.passengerCount = 1,
    this.insuranceFee = 45.00,
    this.taxAmount = 25.00,
    this.pointsDiscount = 64.50,
    this.discountPercentage = 25.0,
    this.isFinal = false,
  });

  // double price from raw string
  double _parsePrice(String rawPrice) {
    String cleanPrice = rawPrice.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleanPrice) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final dividerColor = CustomColors.getBorderColor(context);

    // Price calculation
    double basePricePerPax = _parsePrice(flight.price);
    double totalBasePrice = basePricePerPax * passengerCount;
    double percentageDiscountAmount = (totalBasePrice * discountPercentage) / 100;

    double totalPrice = 0;
    if (isFinal == true) {
      totalPrice = (totalBasePrice + insuranceFee + taxAmount) -
          (pointsDiscount + percentageDiscountAmount);
    } else {
      totalPrice = (totalBasePrice + insuranceFee + taxAmount) -
          (percentageDiscountAmount);
    }

    return CommonCard(
      icon: Icons.monetization_on_outlined,
      title: "Price Details",
      child: Column(
        children: [
          // Base fare per passenger
          PriceRow(
            title: "${flight.airline} (Adult) x$passengerCount",
            amount: "\$${totalBasePrice.toStringAsFixed(2)}",
          ),

          // insurance
          if (insuranceFee > 0)
            PriceRow(
              title: "Travel Insurance",
              amount: "\$${insuranceFee.toStringAsFixed(2)}",
            ),

          // tax amount
          if (taxAmount > 0)
            PriceRow(
              title: "Tax",
              amount: "\$${taxAmount.toStringAsFixed(2)}",
            ),

          // reward points
          if (pointsDiscount > 0 && isFinal == true)
            PriceRow(
              title: "Points Used",
              amount: "- \$${pointsDiscount.toStringAsFixed(2)}",
            ),

          // Percentage discount
          if (discountPercentage > 0)
            PriceRow(
              title: "Discount (${discountPercentage.toInt()}%)",
              amount: "- \$${percentageDiscountAmount.toStringAsFixed(2)}",
            ),

          Divider(height: 20, color: dividerColor),

          // Final total
          PriceRow(
            title: "Total Price",
            amount: "\$${totalPrice.toStringAsFixed(2)}",
            isTotal: true,
          ),
        ],
      ),
    );
  }
}