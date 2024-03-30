import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_food_app/models/food.dart';
import 'package:simple_food_app/models/restaurant.dart';
import 'package:simple_food_app/screens/food_screen.dart';
import 'package:simple_food_app/components/my_food_tile.dart';
import 'package:simple_food_app/components/custom_tab_bar.dart';
import 'package:simple_food_app/components/my_current_location.dart';
import 'package:simple_food_app/components/my_description_box.dart';
import 'package:simple_food_app/components/custom_silver_appbar.dart';
import 'package:simple_food_app/components/custom_drawer/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: Foodcategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(Foodcategory category, List<Food> fullMenu) {
    return fullMenu.where((element) => element.category == category).toList();
  }

  // return list of food in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return Foodcategory.values.map((category) {
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        itemBuilder: (context, index) {
          // get individual food
          final food = categoryMenu[index];

          // get food tile ui
          return FoodTile(
            food: food,
            onTap: () => navigateToFoodDescription(context, food),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Scaffold(
      backgroundColor: style.colorScheme.secondary,
      drawer: const CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomSilverAppBar(
            title: CustomTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: style.colorScheme.secondary,
                ),

                // My Current Location
                const MyCurrentLocation(),

                // Description Box
                const MyDescriptionBox()
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, resturant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(resturant.menu),
          ),
        ),
      ),
    );
  }

  void navigateToFoodDescription(BuildContext ctx, Food food) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodScreen(food: food),
      ),
    );
  }
}
