import 'package:flutter/material.dart';
import 'package:simple_food_app/components/my_receipt.dart';

class DeliveryProgressScreen extends StatelessWidget {
  const DeliveryProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: style.colorScheme.inversePrimary,
        title: const Text('Delivery in progress...'),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, style),
      body: const Column(children: [MyReceipt()]),
    );
  }

  Container _buildBottomNavigationBar(BuildContext context, ThemeData style) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: style.colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
          // profile picture of driver
          Container(
            decoration: BoxDecoration(
                color: style.colorScheme.background, shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 8),

          // Driver Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bilawal Mehfooz',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: style.colorScheme.inversePrimary,
                ),
              ),
              Text('Driver',
                  style: TextStyle(color: style.colorScheme.primary)),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              // message button
              Container(
                decoration: BoxDecoration(
                    color: style.colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(
                    Icons.message,
                    color: style.colorScheme.inversePrimary,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 8),

              // call button
              Container(
                decoration: BoxDecoration(
                    color: style.colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                  icon: const Icon(Icons.call, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
