import 'package:flutter/material.dart';

class PassengerBottomSheet {
  static Future<void> show({
    required BuildContext context,
    required Function(String) onSelected,
  }) async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Passengers",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                title: const Text("1 Seat"),
                onTap: () {
                  onSelected("1 Seat");
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text("2 Seats"),
                onTap: () {
                  onSelected("2 Seats");
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text("3 Seats"),
                onTap: () {
                  onSelected("3 Seats");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}