import 'package:air_booking/utils/custom_colors.dart';
import 'package:air_booking/widgets/common_header.dart';
import 'package:flutter/material.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.getBackgroundColor(context),
      body: Column(
        children: [
          CommonHeader(
            height: 120,
            child: const SafeArea(
              child: Center(
                child: Text(
                  "Saved Flights",
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 70,
                    color: CustomColors.getSubTextColor(context),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "No Saved Flights Yet",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.getTextColor(context),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Tap the bookmark icon on any flight to save it here",
                    style: TextStyle(
                      fontSize: 13,
                      color: CustomColors.getSubTextColor(context),
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