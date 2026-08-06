import 'package:air_booking/models/offer.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  const OfferCard({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2F6BFF),
              Color(0xFF1E5BFF),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: .10,
                child: Image.asset(
                  "assets/images/dots_pattern.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              left: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer.discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    offer.title,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: -100,
              top: 40,
              child: Transform.rotate(
                angle: -0.0,
                child: Image.asset(
                  "assets/images/plane.png",
                  width: 280,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}