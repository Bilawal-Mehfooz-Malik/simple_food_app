import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_food_app/models/cart_item.dart';
import 'package:simple_food_app/models/restaurant.dart';
import 'package:simple_food_app/components/my_quantity_selector.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Consumer<Restaurant>(
      builder: (context, resturant, child) {
        return Container(
          decoration: BoxDecoration(
            color: style.colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // food image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          fit: BoxFit.cover,
                          cartItem.food.imagePath,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.food.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          '\$${cartItem.food.price}',
                          style: TextStyle(color: style.colorScheme.primary),
                        ),
                      ],
                    ),
                    const Spacer(),

                    // increment or decrement quantity
                    QuantitySelector(
                      quantity: cartItem.quantity,
                      food: cartItem.food,
                      onIncrement: () {
                        resturant.addToCart(
                            cartItem.food, cartItem.selectedAddons);
                      },
                      onDecrement: () {
                        resturant.removeFromCart(cartItem);
                      },
                    ),
                  ],
                ),
              ),

              // addons
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  children: cartItem.selectedAddons
                      .map(
                        (addon) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            backgroundColor: style.colorScheme.secondary,
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: style.colorScheme.inversePrimary),
                            shape: StadiumBorder(
                              side:
                                  BorderSide(color: style.colorScheme.primary),
                            ),
                            label: Row(
                              children: [
                                // addon name
                                Text(addon.name),

                                // addon price
                                Text(' (\$${addon.price.toString()})')
                              ],
                            ),
                            onSelected: (value) {},
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
