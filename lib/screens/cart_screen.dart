import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_food_app/models/restaurant.dart';
import 'package:simple_food_app/components/my_cart_tile.dart';
import 'package:simple_food_app/screens/payment_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Consumer<Restaurant>(
      builder: (context, resturant, child) {
        // cart
        final userCart = resturant.cart;

        // scaffold ui
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: style.colorScheme.inversePrimary,
            actions: [
              IconButton(
                  onPressed: () => clearCart(context, resturant),
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              // List of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(child: Text('Cart is empty...')))
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                // get individual cart item
                                final item = userCart[index];

                                // return cart tile ui
                                return CartTile(cartItem: item);
                              },
                            ),
                          ),
                  ],
                ),
              ),

              // go to checkout page
              ElevatedButton(
                  child: const Text('Go to checkout'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PaymentScreen(),
                    ));
                  }),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void clearCart(BuildContext context, Restaurant restaurant) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure you want to clear the cart?'),
        actions: [
          //cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          //yes button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              restaurant.clearCart();
            },
            child: Text(
              'Yes',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
