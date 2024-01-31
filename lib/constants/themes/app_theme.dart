import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.brownCoffeeColor,
            ),
          ),
        ),
        colorSchemeSeed: AppColors.brownCoffeeColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        iconTheme: const IconThemeData(
          color: AppColors.blackColor,
          // size: 24,
        ),
        appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(color: AppColors.blackColor),
          iconTheme: IconThemeData(color: AppColors.blackColor),
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
      );
}
