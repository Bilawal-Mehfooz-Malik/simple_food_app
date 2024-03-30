import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const DrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final invColor = Theme.of(context).colorScheme.inversePrimary;
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: ListTile(
        leading: Icon(icon, color: invColor),
        title: Text(text, style: TextStyle(color: invColor)),
        onTap: onTap,
      ),
    );
  }
}
