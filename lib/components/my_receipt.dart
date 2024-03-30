import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_food_app/models/restaurant.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 48),
      child: Center(
        child: Column(
          children: [
            const Text('Thank you for your order!'),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: style.colorScheme.secondary),
              ),
              child: Consumer<Restaurant>(
                builder: (context, value, child) =>
                    Text(value.displayCartReceipt()),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Estimated delivery time is 30 minutes'),
          ],
        ),
      ),
    );
  }
}
