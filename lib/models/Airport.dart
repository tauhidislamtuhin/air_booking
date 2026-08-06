class Airport {
  final String code;
  final String city;
  final String name;

  const Airport({
    required this.code,
    required this.city,
    required this.name,
  });



  static const airports = [
    Airport(
      code: "DAC",
      city: "Dhaka",
      name: "Hazrat Shahjalal International Airport",
    ),
    Airport(
      code: "CGP",
      city: "Chattogram",
      name: "Shah Amanat International Airport",
    ),
    Airport(
      code: "JFK",
      city: "New York",
      name: "John F. Kennedy International Airport",
    ),
    Airport(
      code: "CDG",
      city: "Paris",
      name: "Charles de Gaulle Airport",
    ),
    Airport(
      code: "DXB",
      city: "Dubai",
      name: "Dubai International Airport",
    ),
    Airport(
      code: "SIN",
      city: "Singapore",
      name: "Singapore Changi Airport",
    ),
    Airport(
      code: "KUL",
      city: "Kuala Lumpur",
      name: "Kuala Lumpur International Airport",
    ),
    Airport(
      code: "LHR",
      city: "London",
      name: "Heathrow Airport",
    ),
  ];
}