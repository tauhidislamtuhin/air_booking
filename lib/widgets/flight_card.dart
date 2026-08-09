import 'package:air_booking/models/flight.dart';
import 'package:air_booking/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  final Flight flight;
  final VoidCallback? onTap;
  final bool isTicket;
  final String? ticketDate;

  const FlightCard({
    super.key,
    required this.flight,
    this.onTap,
    this.isTicket = false,
    this.ticketDate,
  });

  @override
  Widget build(BuildContext context) {
    final cardBg = isTicket ? Colors.white : CustomColors.getCardColor(context);
    final textColor = isTicket ? Colors.black87 : CustomColors.getTextColor(context);
    final subTextColor = isTicket ? Colors.black54 : CustomColors.getSubTextColor(context);
    final dividerColor = isTicket ? Colors.grey.shade300 : CustomColors.getBorderColor(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Card(
        elevation: 2,
        color: cardBg,
        shadowColor: (isDark && !isTicket) ? Colors.black54 : Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              // Airline Header Section
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      flight.logo,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const SizedBox(width: 30, height: 30),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      flight.airline,
                      style: TextStyle(
                        fontSize: isTicket ? 13 : 20,
                        color: textColor,
                        fontWeight: isTicket ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: isTicket ? ticketDate : flight.price,
                          style: TextStyle(
                            color: isTicket ? textColor : CustomColors.primaryColor,
                            fontSize: isTicket ? 12 : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: isTicket ? "" : " /pax",
                          style: TextStyle(
                            color: subTextColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Divider(color: dividerColor),

              const SizedBox(height: 8),

              // Flight Details & Times
              SizedBox(
                height: 120,
                child: Stack(
                  children: [
                    // Airplane Path Icon
                    Positioned(
                      top: 8,
                      left: 75,
                      right: 75,
                      child: Image.asset(
                        "assets/images/white_plan.png",
                        height: 42,
                        fit: BoxFit.fitWidth,
                        color: CustomColors.primaryColor,
                        errorBuilder: (_, _, _) => const SizedBox(),
                      ),
                    ),

                    // Departure Info
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            flight.fromCity,
                            style: TextStyle(
                              color: subTextColor,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            flight.departureTime,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            flight.fromCode,
                            style: TextStyle(
                              color: subTextColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Arrival Info
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            flight.toCity,
                            style: TextStyle(
                              color: subTextColor,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            flight.arrivalTime,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            flight.toCode,
                            style: TextStyle(
                              color: subTextColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Flight Duration
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          flight.duration,
                          style: TextStyle(
                            color: subTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    // Flight Class / Type
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          flight.flightType,
                          style: TextStyle(
                            fontSize: 15,
                            color: subTextColor,
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