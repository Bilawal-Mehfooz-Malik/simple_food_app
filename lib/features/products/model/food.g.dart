// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodImpl _$$FoodImplFromJson(Map<String, dynamic> json) => _$FoodImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      price: (json['price'] as num).toDouble(),
      category: $enumDecode(_$FoodcategoryEnumMap, json['category']),
      availableAddons: (json['availableAddons'] as List<dynamic>)
          .map((e) => Addon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FoodImplToJson(_$FoodImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'price': instance.price,
      'category': _$FoodcategoryEnumMap[instance.category]!,
      'availableAddons': instance.availableAddons,
    };

const _$FoodcategoryEnumMap = {
  Foodcategory.burgers: 'burgers',
  Foodcategory.salads: 'salads',
  Foodcategory.desserts: 'desserts',
  Foodcategory.drinks: 'drinks',
};

_$AddonImpl _$$AddonImplFromJson(Map<String, dynamic> json) => _$AddonImpl(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$AddonImplToJson(_$AddonImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
    };
