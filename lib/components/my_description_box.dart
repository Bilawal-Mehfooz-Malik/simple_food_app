import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    final primaryTextStyle = TextStyle(color: style.colorScheme.inversePrimary);
    final secondaryTextStyle = TextStyle(color: style.colorScheme.primary);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: style.colorScheme.secondary),
      ),
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // delivery  fee
          Column(
            children: [
              Text('\$0.99', style: primaryTextStyle),
              Text('Delivery fee', style: secondaryTextStyle),
            ],
          ),

          //delivery time
          Column(
            children: [
              Text('15-30 min', style: primaryTextStyle),
              Text('Delivery time', style: secondaryTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
