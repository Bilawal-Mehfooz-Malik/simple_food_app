import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_food_app/features/products/model/food.dart';
import 'package:simple_food_app/models/restaurant.dart';

class FoodScreen extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodScreen({super.key, required this.food}) {
    // initialize the selected addons to false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // food image
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Image.asset(widget.food.imagePath, fit: BoxFit.cover),
                ),

                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // food price
                      Text(
                        '\$${widget.food.price.toString()}',
                        style: TextStyle(
                          fontSize: 18,
                          color: style.colorScheme.inversePrimary,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // food description
                      Text(
                        widget.food.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      Divider(color: style.colorScheme.secondary),
                      const SizedBox(height: 12),

                      // addons text
                      Text(
                        'Add-ons',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: style.colorScheme.inversePrimary,
                        ),
                      ),

                      // addons
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: style.colorScheme.secondary),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            // get individual addon
                            Addon addon = widget.food.availableAddons[index];

                            //return the checkbox UI
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                '\$${addon.price.toString()}',
                                style:
                                    TextStyle(color: style.colorScheme.primary),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // button
                ElevatedButton(
                    child: const Text('Add to cart'),
                    onPressed: () =>
                        _addToCart(widget.food, widget.selectedAddons)),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: style.colorScheme.secondary,
              ),
              margin: const EdgeInsets.only(left: 16, top: 8),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }

  // method to add to cart
  void _addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // close the current food page to go back to menu
    Navigator.pop(context);

    // format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }
}
