import 'package:air_booking/utils/custom_colors.dart';
import 'package:air_booking/widgets/common_header.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardBg = CustomColors.getCardColor(context);
    final textColor = CustomColors.getTextColor(context);
    final subTextColor = CustomColors.getSubTextColor(context);

    return Scaffold(
      backgroundColor: CustomColors.getBackgroundColor(context),
      body: Column(
        children: [
          CommonHeader(
            height: 120,
            child: const SafeArea(
              child: Center(
                child: Text(
                  "My Wallet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Balance Card Widget
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Airify Balance",
                              style: TextStyle(color: subTextColor, fontSize: 13),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "\$2,450.00",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: CustomColors.primaryColor,
                          radius: 24,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 60,
                    color: subTextColor,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "No Recent Transactions",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}