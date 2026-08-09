import 'package:air_booking/models/flight_search.dart';
import 'package:air_booking/widgets/flight_card.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../models/flight.dart';
import '../utils/custom_colors.dart';
import '../utils/date_formatter.dart';
import '../widgets/common_header.dart';
import '../widgets/ticket_container.dart';

class TicketScreen extends StatefulWidget {
  final Flight flight;
  final String bookingId;
  final FlightSearch search;

  const TicketScreen({
    super.key,
    required this.flight,
    this.bookingId = "BKG75642895",
    required this.search,
  });

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final WidgetsToImageController _controller = WidgetsToImageController();

  // Capture ticket widget and save to image gallery
  Future<void> _downloadTicket() async {
    try {
      final hasAccess = await Gal.hasAccess();
      if (!hasAccess) {
        await Gal.requestAccess();
      }
      final bytes = await _controller.capture();
      if (bytes != null) {
        await Gal.putImageBytes(bytes);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Ticket downloaded to gallery!"),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to download: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.getBackgroundColor(context),
      body: Column(
        children: [
          CommonHeader(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Column(
                children: [
                  // App bar header
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "E-Ticket",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: _downloadTicket,
                        icon: const Icon(
                          Icons.file_download_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),

                  // Ticket card container printable view
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: WidgetsToImage(
                        controller: _controller,
                        child: TicketContainer(
                          child: Column(
                            children: [
                              // Check-in barcode
                              BarcodeWidget(
                                barcode: Barcode.code128(),
                                data: widget.bookingId,
                                height: 70,
                                drawText: false,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Show your ID and this barcode at the check-in gate",
                                style: TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                              const SizedBox(height: 35),

                              // Ticket summary card
                              FlightCard(
                                flight: widget.flight,
                                isTicket: true,
                                ticketDate: DateFormatter.format(
                                  widget.search.departureDate,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Divider(color: Colors.grey.shade300, height: 1),
                              const SizedBox(height: 15),

                              // Passenger & booking info rows (Static white theme layout)
                              infoRow("Passenger Name", "Mr. Andrew Ainsley"),
                              infoRow("Email", "andrew.ainsley@y...n.com"),
                              infoRow("Phone Number", "+1 111 467 378 399"),
                              infoRow("Class", "Economy"),
                              infoRow("Booking ID", widget.bookingId, isBold: true),
                              infoRow("Flight Number", "EK202"),
                              infoRow("Gate", "25"),
                              infoRow("Seat Number", "B2"),

                              const SizedBox(height: 20),
                              const Text(
                                "Enjoy traveling around the world with us",
                                style: TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "www.airify.yourdomain",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CustomColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
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

  // Static row colors for ticket view across all app modes
  Widget infoRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}