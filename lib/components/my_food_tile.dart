import 'package:flutter/material.dart';
import 'package:simple_food_app/features/products/model/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final VoidCallback onTap;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Row(
              children: [
                // text food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name, style: const TextStyle(fontSize: 16)),
                      Text(
                        '\$${food.price.toString()}',
                        style: TextStyle(
                          color: style.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                          color: style.colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),

                //food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset(food.imagePath, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          indent: 25,
          endIndent: 25,
          color: style.colorScheme.tertiary,
        )
      ],
    );
  }
}
