import 'package:coffee_shop/constants/components/text_custom.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

SnackBar showSnack(String text) {
  return SnackBar(
    backgroundColor: AppColors.brownCoffeeColor,
    content: Center(
      child: TextCustom.h2(
        text,
        color: AppColors.whiteColor,
      ),
    ),
  );
}
