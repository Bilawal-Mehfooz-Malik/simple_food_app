import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_food_app/models/cart_item.dart';
import 'package:simple_food_app/features/products/model/food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = const [
    // burgers
    Food(
      name: 'Classic Cheese burger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'lib/images/burgers/cheese_burger.jpg',
      price: 5.99,
      category: Foodcategory.burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    Food(
      name: 'BBQ Burger',
      description:
          'Smoky BBQ sauce, crispy bacon, and onion rings make this beef burger a savory delight.',
      imagePath: 'lib/images/burgers/bbq_burger.jpg',
      price: 10.99,
      category: Foodcategory.burgers,
      availableAddons: [
        Addon(name: 'Grilled Onions', price: 0.99),
        Addon(name: 'Jalepenos', price: 1.99),
        Addon(name: 'Extra BBQ Sauce', price: 2.99),
      ],
    ),
    Food(
      name: 'Veggie Burger',
      description:
          'A hearty veggie patty topped with fresh avocado, lettuce, and tomato, served on a whole.',
      imagePath: 'lib/images/burgers/veg_burger.jpg',
      price: 8.99,
      category: Foodcategory.burgers,
      availableAddons: [
        Addon(name: 'Vegan cheese', price: 0.99),
        Addon(name: 'Grilled Mushrooms', price: 1.99),
        Addon(name: 'Hummus Spread', price: 2.99),
      ],
    ),

    //salads
    Food(
      name: 'Caesar Salad',
      description:
          'Crisp romaine lettuce, parmesan cheese, croutons, and Caesar dressing.',
      imagePath: 'lib/images/salads/salad1.jpg',
      price: 3.99,
      category: Foodcategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 0.99),
        Addon(name: 'Anchovies', price: 1.99),
        Addon(name: 'Extra Parmesan', price: 2.99),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description:
          'Tomatoes, cucumbers, red onions, olives, feta cheese with olive oil and herbs.',
      imagePath: 'lib/images/salads/salad2.jpg',
      price: 3.99,
      category: Foodcategory.salads,
      availableAddons: [
        Addon(name: 'Feta Cheese', price: 0.99),
        Addon(name: 'Kalamata Olives', price: 1.99),
        Addon(name: 'Grilled Shrimp', price: 2.99),
      ],
    ),
    Food(
      name: 'Quinoa Salad',
      description:
          'Quinoa mixed with cucumbers, tomatoes, bell peppers, and a lemon vinaigrette.',
      imagePath: 'lib/images/salads/salad3.jpg',
      price: 3.99,
      category: Foodcategory.salads,
      availableAddons: [
        Addon(name: 'Avocado', price: 0.99),
        Addon(name: 'Feta Cheese', price: 1.99),
        Addon(name: 'Crilled Chicken', price: 2.99),
      ],
    ),

    // desserts
    Food(
      name: 'Donuts',
      description:
          'Crisp romaine lettuce, parmesan cheese, croutons, and Caesar dressing.',
      imagePath: 'lib/images/desserts/donuts.jpg',
      price: 3.99,
      category: Foodcategory.desserts,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 0.99),
        Addon(name: 'Anchovies', price: 1.99),
        Addon(name: 'Extra Parmesan', price: 2.99),
      ],
    ),
    Food(
      name: 'Cupcake',
      description:
          'Tomatoes, cucumbers, red onions, olives, feta cheese with olive oil and herbs.',
      imagePath: 'lib/images/desserts/oreo_cupcake.jpg',
      price: 3.99,
      category: Foodcategory.desserts,
      availableAddons: [
        Addon(name: 'Feta Cheese', price: 0.99),
        Addon(name: 'Kalamata Olives', price: 1.99),
        Addon(name: 'Grilled Shrimp', price: 2.99),
      ],
    ),
    Food(
      name: 'Strawberry Cake',
      description:
          'Quinoa mixed with cucumbers, tomatoes, bell peppers, and a lemon vinaigrette.',
      imagePath: 'lib/images/desserts/strawberry_cake.jpg',
      price: 3.99,
      category: Foodcategory.desserts,
      availableAddons: [
        Addon(name: 'Avocado', price: 0.99),
        Addon(name: 'Feta Cheese', price: 1.99),
        Addon(name: 'Crilled Chicken', price: 2.99),
      ],
    ),

    // drinks
    Food(
      name: 'Mango Juice',
      description:
          'Crisp romaine lettuce, parmesan cheese, croutons, and Caesar dressing.',
      imagePath: 'lib/images/drinks/mango_orange_juice.jpg',
      price: 3.99,
      category: Foodcategory.drinks,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 0.99),
        Addon(name: 'Anchovies', price: 1.99),
        Addon(name: 'Extra Parmesan', price: 2.99),
      ],
    ),
    Food(
      name: 'Milk Shake',
      description:
          'Tomatoes, cucumbers, red onions, olives, feta cheese with olive oil and herbs.',
      imagePath: 'lib/images/drinks/beverage_milkshake.jpg',
      price: 3.99,
      category: Foodcategory.drinks,
      availableAddons: [
        Addon(name: 'Feta Cheese', price: 0.99),
        Addon(name: 'Kalamata Olives', price: 1.99),
        Addon(name: 'Grilled Shrimp', price: 2.99),
      ],
    ),
    Food(
      name: 'Lemon Juice',
      description:
          'Quinoa mixed with cucumbers, tomatoes, bell peppers, and a lemon vinaigrette.',
      imagePath: 'lib/images/drinks/lemon_juice.jpg',
      price: 3.99,
      category: Foodcategory.drinks,
      availableAddons: [
        Addon(name: 'Avocado', price: 0.99),
        Addon(name: 'Feta Cheese', price: 1.99),
        Addon(name: 'Crilled Chicken', price: 2.99),
      ],
    ),
  ];

  /*

  Getters

   */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*

  Operations

   */

  // user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameAddons && isSameFood;
    });

    // if item already exists increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  Helpers
   */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's is your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('----------');

    for (final cartItem in _cart) {
      receipt.writeln(
          '${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}');
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln('   Add-ons: ${_formatAddons(cartItem.selectedAddons)}');
      }
      receipt.writeln();
    }
    receipt.writeln('----------');
    receipt.writeln('Total Items: ${getTotalItemCount()}');
    receipt.writeln('Total Price: ${_formatPrice(getTotalPrice())}');

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => '${addon.name} (${_formatPrice(addon.price)})')
        .join(', ');
  }
}
