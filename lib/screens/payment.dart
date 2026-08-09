import 'package:air_booking/models/flight.dart';
import 'package:air_booking/models/flight_search.dart';
import 'package:air_booking/screens/ticket.dart';
import 'package:air_booking/utils/booking_stepper.dart';
import 'package:air_booking/widgets/PriceDetailsCard.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import '../widgets/common_card.dart';
import '../widgets/common_header.dart';
import '../widgets/custom_button.dart';
import '../widgets/flight_card.dart';
import '../widgets/payment_countdown.dart';

class PaymentScreen extends StatefulWidget {
  final Flight flight;
  final FlightSearch search;

  const PaymentScreen({
    super.key,
    required this.flight,
    required this.search,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isPointsUsed = true;

  @override
  Widget build(BuildContext context) {
    final cardBg = CustomColors.getCardColor(context);
    final textColor = CustomColors.getTextColor(context);
    final subTextColor = CustomColors.getSubTextColor(context);

    return Scaffold(
      backgroundColor: CustomColors.getBackgroundColor(context),
      body: Column(
        children: [
          // Screen header with stepper and countdown timer
          CommonHeader(
            height: 180,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              "Payment Confirmation",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const BookingStepper(currentStep: 2),
                    const SizedBox(height: 10),
                    PaymentCountdown(
                      totalSeconds: 7200,
                      onTimerFinished: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  FlightCard(flight: widget.flight),
                  const SizedBox(height: 10),

                  // Wallet and payment method
                  CommonCard(
                    icon: Icons.credit_card_outlined,
                    title: "Payment Method",
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: CustomColors.primaryColor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: CustomColors.primaryColor,
                          size: 25,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "My Wallet",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "\$29,846.50",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // points toggle
                  CommonCard(
                    icon: Icons.monetization_on_outlined,
                    title: "You Have 6,450 Points",
                    trailing: Switch.adaptive(
                      value: isPointsUsed,
                      activeColor: CustomColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          isPointsUsed = val;
                        });
                      },
                    ),
                    child: Text(
                      "100 points equals \$1.00. You will get\n1,000 points after this booking.",
                      style: TextStyle(
                        fontSize: 12,
                        color: subTextColor,
                        height: 1.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Voucher & discounts
                  CommonCard(
                    icon: Icons.disc_full_outlined,
                    title: "Discounts / Vouchers",
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: CustomColors.primaryColor,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: CustomColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "VKZ5J9",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Final price details breakdown
                  PriceDetailsCard(
                    flight: widget.flight,
                    isFinal: isPointsUsed,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom navigation checkout action button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: cardBg,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: CustomButton(
            text: "Continue",
            borderRadius: 18,
            height: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TicketScreen(
                    flight: widget.flight,
                    search: widget.search,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}