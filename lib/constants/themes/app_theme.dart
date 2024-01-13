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
        useMaterial3: false,
        brightness: Brightness.light,
        primaryColor: AppColors.blackColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        //iconTheme: const IconThemeData(
        //  color: AppColors.russianViolet,
        //  size: 24,
        //),
        //primaryIconTheme: const IconThemeData(
        //  color: AppColors.russianViolet,
        //  size: 24,
        //),
        //splashColor: AppColors.flame,
        appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(color: AppColors.blackColor),
          iconTheme: IconThemeData(color: AppColors.blackColor),
          //systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
        //cardTheme: AppCardTheme.lightCardTheme,
        //cardColor: AppCardTheme.lightCardTheme.color,
        //shadowColor: AppCardTheme.shadowColor,
        //dividerColor: AppColors.neutros90Magnolia,
        //dividerTheme: const DividerThemeData(
        //  color: AppColors.neutros90Magnolia,
        //),
        //tabBarTheme: const TabBarTheme(
        //  indicatorColor: AppColors.flame40,
        //  labelColor: AppColors.flame40,
        //  unselectedLabelColor: AppColors.russianViolet,
        //  labelStyle: AppText.styleSubtitle3,
        //  unselectedLabelStyle: AppText.styleSubtitle3,
        //  indicatorSize: TabBarIndicatorSize.label,
        //),
        //inputDecorationTheme: InputDecorationTheme(
        //  filled: true,
        //  fillColor: AppColors.neutros90Magnolia,
        //  labelStyle: AppText.styleTextFieldLabel,
        //  errorStyle: AppText.styleTextFieldError,
        //  activeIndicatorBorder: const BorderSide(
        //    color: AppColors.russianViolet,
        //  ),
        //  errorMaxLines: 2,
        //  focusColor: AppColors.russianViolet,
        //  iconColor: AppColors.russianViolet,
        //  prefixIconColor: AppColors.russianViolet,
        //  suffixIconColor: AppColors.russianViolet,
        //  border: const UnderlineInputBorder(
        //   borderSide: BorderSide(color: AppColors.neutros10Xiketic, width: 2,
        // ),
        //    borderRadius: BorderRadius.only(
        //      topLeft: Radius.circular(12),
        //      topRight: Radius.circular(12),
        //    ),
        //  ),
        //  focusedBorder: const UnderlineInputBorder(
        //    borderSide: BorderSide(color: AppColors.russian50, width: 2),
        //    borderRadius: BorderRadius.only(
        //      topLeft: Radius.circular(12),
        //      topRight: Radius.circular(12),
        //    ),
        //  ),
        //  errorBorder: const UnderlineInputBorder(
        //    borderSide: BorderSide(
        //      color: AppColors.errorEnglishVermillion,
        //      width: 2,
        //    ),
        //    borderRadius: BorderRadius.only(
        //      topLeft: Radius.circular(12),
        //      topRight: Radius.circular(12),
        //    ),
        //  ),
        //),
        //colorScheme: ColorScheme.fromSwatch().copyWith(
        //  secondary: AppColors.flame,
        //  background: AppColors.neutros95GhostWhite,
        //  error: AppColors.errorEnglishVermillion,
        //),
        //bottomSheetTheme: const BottomSheetThemeData(
        //  backgroundColor: AppColors.white,
        //  modalBackgroundColor: AppColors.white,
        //  elevation: 10,
        //),
        //checkboxTheme: CheckboxThemeData(
        //  overlayColor: const MaterialStatePropertyAll(AppColors.white),
        //  checkColor: const MaterialStatePropertyAll(AppColors.white),
        //  fillColor: const MaterialStatePropertyAll(AppColors.flame),
        //  side: const BorderSide(style: BorderStyle.none),
        //  shape: RoundedRectangleBorder(
        //    side: const BorderSide(
        //      color: AppColors.russianViolet,
        //      width: 2,
        //    ),
        //    borderRadius: BorderRadius.circular(4),
        //  ),
        //),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
      );
}
