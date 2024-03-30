// Food item
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final Foodcategory category;
  final List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// Food Categories
enum Foodcategory {
  burgers,
  salads,
  desserts,
  drinks,
}

// Food addons
class Addon {
  String name;
  double price;
  Addon({
    required this.name,
    required this.price,
  });
}
