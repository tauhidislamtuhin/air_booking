class Offer {
  final String title;
  final String image;
  final String discount;

  const Offer({
    required this.title,
    required this.image,
    required this.discount,
  });

  static List<Offer> offers = [
    Offer(
      title: "On all domestic flights",
      discount: "25% OFF",
      image: "assets/images/plane.png",
    ),
    Offer(
      title: "International Flights",
      discount: "40% OFF",
      image: "assets/images/plane.png",
    ),
    Offer(
      title: "Business Class",
      discount: "15% OFF",
      image: "assets/images/plane.png",
    ),
  ];
}