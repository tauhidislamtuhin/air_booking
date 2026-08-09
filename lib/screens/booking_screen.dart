import 'package:air_booking/models/flight.dart';
import 'package:air_booking/models/flight_search.dart';
import 'package:air_booking/screens/payment.dart';
import 'package:air_booking/utils/booking_stepper.dart';
import 'package:air_booking/widgets/PriceDetailsCard.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import '../widgets/common_card.dart';
import '../widgets/common_header.dart';
import '../widgets/custom_button.dart';
import '../widgets/flight_card.dart';
import '../widgets/flight_info_card.dart';

class BookingScreen extends StatefulWidget {
  final Flight flight;
  final FlightSearch search;

  const BookingScreen({
    super.key,
    required this.flight,
    required this.search,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    final cardBg = CustomColors.getCardColor(context);
    final textColor = CustomColors.getTextColor(context);
    final subTextColor = CustomColors.getSubTextColor(context);
    final borderColor = CustomColors.getBorderColor(context);

    return Scaffold(
      backgroundColor: CustomColors.getBackgroundColor(context),
      body: Column(
        children: [
          // Screen header with stepper
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
                              "Fill In Details",
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
                    const BookingStepper(currentStep: 1),
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
                  // flight info
                  FlightCard(flight: widget.flight),
                  const SizedBox(height: 12),

                  // Flight amenities
                  FlightInfoCard(
                    flight: widget.flight,
                    title: "Flight Amenities",
                    icon: Icons.airplane_ticket_outlined,
                    isCustomRow: false,
                  ),
                  const SizedBox(height: 12),

                  // Contact details
                  CommonCard(
                    icon: Icons.person_outline,
                    title: "Contact Details",
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_outlined,
                        color: CustomColors.primaryColor,
                        size: 20,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Andrew Ainsley",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "andrew.ainsley@y...in.com  ·  +1 111 467 378 399",
                          style: TextStyle(
                            fontSize: 12,
                            color: subTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Passenger selection
                  CommonCard(
                    icon: Icons.group_outlined,
                    title: "Passenger(s) Details",
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: CustomColors.primaryColor,
                        size: 22,
                      ),
                    ),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Passenger',
                        labelStyle: TextStyle(
                          color: subTextColor,
                          fontSize: 13,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: borderColor),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mr. Andrew Ainsley",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: subTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Seat selection
                  CommonCard(
                    icon: Icons.airline_seat_recline_extra_outlined,
                    title: "Seat Number",
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: CustomColors.primaryColor,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: borderColor.withAlpha(50),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mr. Andrew Ainsley",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                          Text(
                            "B2",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Price breakdown details
                  PriceDetailsCard(flight: widget.flight),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom navigation checkout button
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
                  builder: (_) => PaymentScreen(
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