import 'package:freezed_annotation/freezed_annotation.dart';

part 'food.freezed.dart';
part 'food.g.dart';

@freezed
class Food with _$Food {
  const factory Food({
    required String name,
    required String description,
    required String imagePath,
    required double price,
    required Foodcategory category,
    required List<Addon> availableAddons,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
}

@freezed
class Addon with _$Addon {
  const factory Addon({
    required String name,
    required double price,
  }) = _Addon;

  factory Addon.fromJson(Map<String, dynamic> json) => _$AddonFromJson(json);
}

// Food categories
enum Foodcategory { burgers, salads, desserts, drinks }
