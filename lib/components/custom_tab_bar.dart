import 'package:flutter/material.dart';
import 'package:simple_food_app/models/food.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  const CustomTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return Foodcategory.values
        .map((e) => Tab(text: e.toString().split('.').last))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(controller: tabController, tabs: _buildCategoryTabs());
  }
}
