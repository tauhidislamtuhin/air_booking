import 'airport.dart';

class FlightSearch {
  final Airport fromAirport;
  final Airport toAirport;
  final DateTime? departureDate;
  final DateTime? returnDate;
  final String passenger;
  final String travelClass;
  final int tripType; // 0 = One Way, 1 = Round Trip, 2 = Multi City

  const FlightSearch({
    required this.fromAirport,
    required this.toAirport,
    required this.departureDate,
    required this.returnDate,
    required this.passenger,
    required this.travelClass,
    required this.tripType,
  });
}