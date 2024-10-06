import 'package:flutter/material.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/themes/colors.dart';

const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(Sizes.p8)));

final darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkSurfaceColor,

  // [Color Scheme]
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: darkPrimaryColor,
    onPrimary: darkOnPrimaryColor,
    secondary: darkSecondaryColor,
    onSecondary: darkOnSecondaryColor,
    error: darkErrorColor,
    onError: darkOnErrorColor,
    surface: darkSurfaceColor,
    onSurface: darkOnSurfaceColor,
  ),

  // [Elevate Button Theme]
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(_shape),
      backgroundColor: WidgetStatePropertyAll(darkPrimaryColor),
      foregroundColor: WidgetStatePropertyAll(darkOnPrimaryColor),
      minimumSize: WidgetStatePropertyAll(Size(double.infinity, 44)),
      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
    ),
  ),

  // // [Text Button Theme]
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(darkOnPrimaryColor),
      minimumSize: WidgetStatePropertyAll(Size(double.infinity, 44)),
      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
    ),
  ),

  // [List Tile Theme]
  // listTileTheme: const ListTileThemeData(
  //   tileColor: darkSecondaryColor,
  //   titleTextStyle: TextStyle(
  //     color: darkOnSurfaceColor,
  //     fontWeight: FontWeight.normal,
  //     decorationThickness: 2,
  //   ),
  //   subtitleTextStyle: TextStyle(color: darkOnSecondaryColor),
  //   shape: _shape,
  // ),

  // // [Check Box Theme]
  // checkboxTheme: const CheckboxThemeData(shape: CircleBorder()),

  // [Dialog theme]
  // dialogTheme: const DialogTheme(
  //   shape: _shape,
  //   backgroundColor: darkSecondaryColor,
  //   contentTextStyle: TextStyle(color: darkOnSecondaryColor),
  // ),

  bottomSheetTheme: const BottomSheetThemeData(
    shape: _shape,
    backgroundColor: darkSecondaryColor,
  ),

  // // [Date Picker Theme]
  // datePickerTheme:
  //     const DatePickerThemeData(backgroundColor: darkSecondaryColor),

  // // [Icon Button Theme]
  // iconButtonTheme: const IconButtonThemeData(
  //   style: ButtonStyle(
  //     padding: WidgetStatePropertyAll(EdgeInsets.zero),
  //   ),
  // ),

  // // [Card Theme]
  // cardTheme: const CardTheme(color: darkSecondaryColor, shape: _shape),
);
