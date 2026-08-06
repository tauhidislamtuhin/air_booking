class Flight {
  final String airline;
  final String logo;
  final String price;

  final String fromCity;
  final String fromCode;
  final String departureTime;

  final String toCity;
  final String toCode;
  final String arrivalTime;

  final String duration;
  final String flightType;

  Flight({
    required this.airline,
    required this.logo,
    required this.price,
    required this.fromCity,
    required this.fromCode,
    required this.departureTime,
    required this.toCity,
    required this.toCode,
    required this.arrivalTime,
    required this.duration,
    required this.flightType,
  });


  static List<Flight> flights = [
    Flight(
      airline: "Emirates",
      logo: "assets/images/emirates.png",
      price: "\$1,599.00",
      fromCity: "New York",
      fromCode: "JFK",
      departureTime: "09:00",
      toCity: "Paris",
      toCode: "CDG",
      arrivalTime: "16:30",
      duration: "7h 30m",
      flightType: "Direct",
    ),

    Flight(
      airline: "Qatar Airways",
      logo: "assets/images/qatar.png",
      price: "\$1,420.00",
      fromCity: "Dhaka",
      fromCode: "DAC",
      departureTime: "11:45",
      toCity: "Doha",
      toCode: "DOH",
      arrivalTime: "14:10",
      duration: "5h 25m",
      flightType: "Direct",
    ),

    Flight(
      airline: "Singapore Airlines",
      logo: "assets/images/singapore.png",
      price: "\$1,780.00",
      fromCity: "Singapore",
      fromCode: "SIN",
      departureTime: "08:15",
      toCity: "Tokyo",
      toCode: "NRT",
      arrivalTime: "16:00",
      duration: "6h 45m",
      flightType: "Direct",
    ),

    Flight(
      airline: "Turkish Airlines",
      logo: "assets/images/turkish.png",
      price: "\$1,250.00",
      fromCity: "Istanbul",
      fromCode: "IST",
      departureTime: "13:20",
      toCity: "London",
      toCode: "LHR",
      arrivalTime: "15:45",
      duration: "4h 25m",
      flightType: "Direct",
    ),

    Flight(
      airline: "Biman Bangladesh",
      logo: "assets/images/biman.png",
      price: "\$980.00",
      fromCity: "Dhaka",
      fromCode: "DAC",
      departureTime: "06:30",
      toCity: "Bangkok",
      toCode: "BKK",
      arrivalTime: "10:20",
      duration: "2h 50m",
      flightType: "Direct",
    ),
  ];
}