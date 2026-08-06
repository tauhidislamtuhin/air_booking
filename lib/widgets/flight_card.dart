import 'package:air_booking/models/flight.dart';
import 'package:air_booking/utils/custom_colors.dart';
import 'package:flutter/material.dart';

import '../utils/date_formatter.dart';

class FlightCard extends StatelessWidget {
  final Flight flight;
  final VoidCallback? onTap;
  final bool isTicket;
  final String? ticketDate;

  const FlightCard({
    super.key,
    required this.flight,
    this.onTap, this.isTicket = false, this.ticketDate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Card(
        elevation: 2,
        color: Colors.white,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      flight.logo,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      flight.airline,
                      style: TextStyle(
                        fontSize: isTicket ? 13 : 20,
                        color: Colors.black,
                        fontWeight: isTicket ? FontWeight.bold : FontWeight.normal,


                      ),
                    ),
                  ),

                  RichText(
                    text: TextSpan(
                      children: [

                        TextSpan(
                          text:isTicket ? ticketDate: flight.price,
                          style: TextStyle(
                            color:isTicket ? Colors.black : CustomColors.primaryColor,
                            fontSize: isTicket ? 12 : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        TextSpan(
                          text:isTicket ? "" : " /pax",
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

              const SizedBox(height: 8),

              Divider(color: Colors.grey.shade300),

              const SizedBox(height: 8),

              SizedBox(
                height: 120,
                child: Stack(
                  children: [

                    Positioned(
                      top: 8,
                      left: 75,
                      right: 75,
                      child: Image.asset(
                        "assets/images/white_plan.png",
                        height: 42,
                        fit: BoxFit.fitWidth,
                        color: CustomColors.primaryColor,
                      ),
                    ),

                    Positioned(
                      left: 0,
                      top: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            flight.fromCity,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            flight.departureTime,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            flight.fromCode,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      right: 0,
                      top: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            flight.toCity,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            flight.arrivalTime,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            flight.toCode,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),


                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          flight.duration,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          flight.flightType,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}