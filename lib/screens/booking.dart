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
  const BookingScreen({super.key, required this.flight, required this.search,});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: [
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  FlightCard(flight: widget.flight),
                  const SizedBox(height: 12),
                  FlightInfoCard(
                    flight: widget.flight,
                    title: "Flight Amenities",
                    icon: Icons.airplane_ticket_outlined,
                    isCustomRow: false,
                  ),
                  const SizedBox(height: 12),

                  CommonCard(
                    icon: Icons.person_outline,
                    title: "Contact Details",
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit_outlined, color: CustomColors.primaryColor, size: 20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Andrew Ainsley",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "andrew.ainsley@y...in.com  ·  +1 111 467 378 399",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  CommonCard(
                    icon: Icons.group_outlined,
                    title: "Passenger(s) Details",
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: CustomColors.primaryColor, size: 22),
                    ),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Passenger',
                        labelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Mr. Andrew Ainsley",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),


                  // Seat Number
                  CommonCard(
                    icon: Icons.airline_seat_recline_extra_outlined,
                    title: "Seat Number",
                    trailing:  Icon(Icons.arrow_forward_ios, size: 14, color: CustomColors.primaryColor),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Mr. Andrew Ainsley",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "B2",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  PriceDetailsCard(flight: widget.flight),
                ],
              ),
            ),
          ),
        ],
      ),

      //BottomButton
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
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
                    search : widget.search
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