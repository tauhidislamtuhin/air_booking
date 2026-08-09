import 'package:air_booking/screens/search_screen.dart';
import 'package:air_booking/utils/passenger_bottom_sheet.dart';
import 'package:air_booking/widgets/common_header.dart';
import 'package:air_booking/widgets/custom_textfield.dart';
import 'package:air_booking/widgets/trip_selection.dart';
import 'package:flutter/material.dart';

import '../models/airport.dart';
import '../models/flight_search.dart';
import '../models/offer.dart';
import '../utils/class_bottom_sheet.dart';
import '../utils/custom_colors.dart';
import '../utils/date_formatter.dart';
import '../utils/date_picker.dart';
import '../widgets/airport_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/offer_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  Airport? fromAirport = Airport.airports[2];
  Airport? toAirport = Airport.airports[3];

  DateTime? departureDate;
  DateTime? returnDate;
  String passenger = "1 Seat";
  String travelClass = "Economy";

  // Swap departure and destination airports
  void swapAirport() {
    setState(() {
      final temp = fromAirport;
      fromAirport = toAirport;
      toAirport = temp;
    });
  }

  // Update trip selection index
  void onChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardBg = CustomColors.getCardColor(context);
    final textColor = CustomColors.getTextColor(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CustomColors.getBackgroundColor(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header and search card stack
            Stack(
              children: [
                CommonHeader(height: 350),
                SafeArea(

                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        // User profile header
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 22,
                              backgroundImage: AssetImage(
                                "assets/images/profile.png",
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Good Morning 👋",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  Text(
                                    "Andrew Ainsley",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Notification icon
                            Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(0),
                                  child: const Icon(
                                    Icons.circle_notifications_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),

                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // Main flight search form card
                        Card(
                          color: cardBg,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                TripSelection(
                                  selectedIndex: selectedIndex,
                                  onChanged: onChanged,
                                ),
                                const SizedBox(height: 20),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          // Airport fields
                                          AirportTextField(
                                            title: "From",
                                            icon: Icons.flight_takeoff_outlined,
                                            airport: fromAirport,
                                            onSelected: (airport) {
                                              setState(() {
                                                fromAirport = airport;
                                              });
                                            },
                                          ),

                                          const SizedBox(height: 16),

                                          AirportTextField(
                                            title: "To",
                                            icon: Icons.flight_land_outlined,
                                            airport: toAirport,
                                            onSelected: (airport) {
                                              setState(() {
                                                toAirport = airport;
                                              });
                                            },
                                          ),
                                          const SizedBox(height: 15),

                                          // Date fields
                                          Column(
                                            children: [
                                              if (selectedIndex == 0 ||
                                                  selectedIndex == 2)
                                                CustomTextField(
                                                  title: "Departure Date",
                                                  value: DateFormatter.format(
                                                    departureDate,
                                                  ),
                                                  icon: Icons
                                                      .calendar_month_outlined,
                                                  onTap: () {
                                                    DatePickerHelper.show(
                                                      context: context,
                                                      initialDate:
                                                      departureDate,
                                                      onSelected: (date) {
                                                        setState(() {
                                                          departureDate = date;
                                                        });
                                                      },
                                                    );
                                                  },
                                                ),

                                              if (selectedIndex == 1) ...[
                                                CustomTextField(
                                                  title: "Departure",
                                                  value: DateFormatter.format(
                                                    departureDate,
                                                  ),
                                                  icon: Icons
                                                      .calendar_month_outlined,
                                                  onTap: () {
                                                    DatePickerHelper.show(
                                                      context: context,
                                                      initialDate:
                                                      departureDate,
                                                      onSelected: (date) {
                                                        setState(() {
                                                          departureDate = date;
                                                          if (returnDate !=
                                                              null &&
                                                              returnDate!
                                                                  .isBefore(
                                                                date,
                                                              )) {
                                                            returnDate = null;
                                                          }
                                                        });
                                                      },
                                                    );
                                                  },
                                                ),

                                                const SizedBox(height: 16),

                                                CustomTextField(
                                                  title: "Return",
                                                  value: DateFormatter.format(
                                                    returnDate,
                                                  ),
                                                  icon: Icons
                                                      .calendar_month_outlined,
                                                  onTap: () {
                                                    if (departureDate == null) {
                                                      _showSnackBar(
                                                        context,
                                                        "Please select departure date first",
                                                      );
                                                      return;
                                                    }
                                                    DatePickerHelper.show(
                                                      context: context,
                                                      initialDate:
                                                      returnDate ??
                                                          departureDate,
                                                      firstDate: departureDate,
                                                      onSelected: (date) {
                                                        setState(() {
                                                          returnDate = date;
                                                        });
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ],
                                          ),
                                          const SizedBox(height: 15),

                                          // Passengers & Class selection
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustomTextField(
                                                  title: "Passengers",
                                                  value: passenger,
                                                  icon: Icons.groups_2_outlined,
                                                  onTap: () {
                                                    PassengerBottomSheet.show(
                                                      context: context,
                                                      onSelected: (value) {
                                                        setState(() {
                                                          passenger = value;
                                                        });
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),

                                              const SizedBox(width: 12),

                                              Expanded(
                                                child: CustomTextField(
                                                  title: "Class",
                                                  value: travelClass,
                                                  icon: Icons
                                                      .airline_seat_recline_normal_outlined,
                                                  onTap: () {
                                                    ClassBottomSheet.show(
                                                      context: context,
                                                      onSelected: (value) {
                                                        setState(() {
                                                          travelClass = value;
                                                        });
                                                      },
                                                    );
                                                  },
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 15),

                                          // Search action button
                                          SizedBox(
                                            width: double.infinity,
                                            height: 55,
                                            child: CustomButton(
                                              text: "Search Flight",
                                              onPressed: () {
                                                if (fromAirport == null) {
                                                  _showSnackBar(
                                                    context,
                                                    "Please select departure airport",
                                                  );
                                                  return;
                                                }

                                                if (toAirport == null) {
                                                  _showSnackBar(
                                                    context,
                                                    "Please select destination airport",
                                                  );
                                                  return;
                                                }

                                                if (departureDate == null) {
                                                  _showSnackBar(
                                                    context,
                                                    "Please select departure date",
                                                  );
                                                  return;
                                                }

                                                if (selectedIndex == 1 &&
                                                    returnDate == null) {
                                                  _showSnackBar(
                                                    context,
                                                    "Please select return date",
                                                  );
                                                  return;
                                                }

                                                final search = FlightSearch(
                                                  fromAirport: fromAirport!,
                                                  toAirport: toAirport!,
                                                  departureDate: departureDate,
                                                  returnDate: returnDate,
                                                  passenger: passenger,
                                                  travelClass: travelClass,
                                                  tripType: selectedIndex,
                                                );

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        SearchScreen(
                                                          search: search,
                                                        ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Swap airports floating button
                                    Positioned(
                                      right: 8,
                                      top: 45,
                                      child: CircleAvatar(
                                        radius: 24,
                                        backgroundColor:
                                        CustomColors.primaryColor,
                                        child: IconButton(
                                          onPressed: () {
                                            swapAirport();
                                          },
                                          icon: const Icon(
                                            Icons.swap_vert,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Special offers header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special Offers",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: CustomColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Offers list view
            SizedBox(
              height: 150,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: Offer.offers.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 320,
                    child: OfferCard(offer: Offer.offers[index]),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Display validation messages
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}