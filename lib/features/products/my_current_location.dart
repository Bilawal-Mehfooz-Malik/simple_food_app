import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(color: style.colorScheme.primary),
          ),
          InkWell(
            onTap: () => openLocationSearchBox(context, style),
            child: Row(
              children: [
                // address
                Text(
                  'F1 Mirpur, Azad Kashmir',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: style.colorScheme.inversePrimary,
                  ),
                ),

                // dropdown menu
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }

  void openLocationSearchBox(BuildContext context, ThemeData style) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your location'),
        content: const TextField(
          decoration: InputDecoration(hintText: 'Search address...'),
        ),
        actions: [
          // cancel button
          MaterialButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: style.colorScheme.inversePrimary),
            ),
            onPressed: () => Navigator.pop(context),
          ),

          // save button
          MaterialButton(
            child: const Text('Save'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
