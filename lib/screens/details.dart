import 'package:air_booking/models/flight_search.dart';
import 'package:air_booking/screens/booking.dart';
import 'package:air_booking/utils/custom_colors.dart';
import 'package:air_booking/widgets/common_header.dart';
import 'package:air_booking/widgets/custom_button.dart';
import 'package:air_booking/widgets/flight_info_card.dart';
import 'package:flutter/material.dart';

import '../models/flight.dart';
import '../widgets/flight_card.dart';

class DetailsScreen extends StatefulWidget {
  final Flight flight;
  final FlightSearch search;

  const DetailsScreen({super.key, required this.flight, required this.search});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: [
          CommonHeader(
            height: 100,
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Flight Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.bookmark_added_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.share_outlined, color: Colors.white),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  FlightCard(flight: widget.flight),
                  const SizedBox(height: 20),
                  FlightInfoCard(flight:widget.flight,isCustomRow: true,)
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total price: 1 person(s)",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.flight.price,
                      style: TextStyle(
                        color: CustomColors.primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomButton(
                  text: "Continue",
                  borderRadius: 18,
                  height: 50,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookingScreen(
                          flight: widget.flight,
                          search: widget.search,
                        ),
                      ),
                    );

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}