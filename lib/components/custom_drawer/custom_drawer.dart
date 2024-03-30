import 'package:flutter/material.dart';
import 'package:simple_food_app/components/custom_drawer/setting_screen.dart';
import 'package:simple_food_app/components/custom_drawer/custom_drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Drawer(
      backgroundColor: style.colorScheme.background,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              size: 80,
              Icons.lock_open_outlined,
              color: style.colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Divider(color: style.colorScheme.secondary),
          ),
          // Home List Tile
          DrawerTile(
            text: 'Home',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // setting list tile
          DrawerTile(
              text: 'Settings',
              icon: Icons.settings,
              onTap: () {
                goToSetting(context);
              }),

          // logout list tile
          DrawerTile(
            text: 'Log out',
            icon: Icons.logout_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void goToSetting(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const SettingScreen();
        },
      ),
    );
  }
}
