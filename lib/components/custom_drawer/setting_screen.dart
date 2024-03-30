import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_food_app/themes/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    final themeProv = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: style.colorScheme.background,
      ),
      body: Column(
        children: [
          // Dark Mode List Tile
          ListTile(
            tileColor: style.colorScheme.secondary,
            title: Text(
              'Dark Mode',
              style: TextStyle(
                color: style.colorScheme.inversePrimary,
              ),
            ),
            trailing: CupertinoSwitch(
              value: themeProv.isDarkMode,
              onChanged: (value) => themeProv.toggoleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}
