class Coffee {
  Coffee({
    required this.id,
    required this.name,
    required this.intensity,
    required this.beverageType,
    required this.price,
    required this.isAtive,
    required this.bestSellers,
    required this.imageAssets,
    required this.description,
    required this.rating,
  });
  final int id;
  final String name;
  final int intensity;
  final String beverageType;
  final double price;
  final bool isAtive;
  final bool bestSellers;
  final String imageAssets;
  final String description;
  final double rating;
}
