import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

enum AppThemes { lightTheme, darkTheme }

extension AppThemesExtension on AppThemes {
  static AppThemes get defaultTheme => AppThemes.lightTheme;

  ThemeData get themeData {
    switch (this) {
      case AppThemes.darkTheme:
        return AppTheme.darkTheme;
      case AppThemes.lightTheme:
        return AppTheme.lightTheme;
    }
  }
}

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        //primarySwatch: Colors.brown,
        colorSchemeSeed: AppColors.brownCoffeeColor,
        //primaryColor: AppColors.blackColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        iconTheme: const IconThemeData(
          color: AppColors.blackColor,
          // size: 24,
        ),
        //primaryIconTheme: const IconThemeData(
        //  color: AppColors.blackColor,
        //  size: 24,
        //),
        //splashColor: AppColors.blackColor,
        appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(color: AppColors.blackColor),
          iconTheme: IconThemeData(color: AppColors.blackColor),
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        //TODO: ADICIONAR TEMA ESCURO
        useMaterial3: false,
        brightness: Brightness.dark,
      );
}
