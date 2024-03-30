import 'package:flutter/material.dart';
import 'package:simple_food_app/screens/cart_screen.dart';

class CustomSilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const CustomSilverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return SliverAppBar(
      title: const Text('Nafees Online'),
      pinned: true,
      floating: false,
      centerTitle: true,
      expandedHeight: 340,
      collapsedHeight: 120,
      backgroundColor: style.colorScheme.background,
      foregroundColor: style.colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        centerTitle: true,
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CartScreen();
              }));
            },
            icon: const Icon(Icons.shopping_cart)),
      ],
    );
  }
}
