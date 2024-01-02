import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:app_coffee_shop/constants/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomText {
  static Widget h1(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.5,
        color: AppColors.blackColor,
      ),
      maxLines: 3,
      textAlign: TextAlign.start,
    );
  }

  static Widget h2(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 1.2,
        color: AppColors.whiteColor,
      ),
      maxLines: 2,
      textAlign: TextAlign.start,
    );
  }

  static Widget body(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppFonts.inter,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1,
        color: AppColors.blackColor,
      ),
      textAlign: TextAlign.start,
    );
  }

  static Widget descrition(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        height: 1,
        color: Color.fromARGB(255, 80, 80, 80),
      ),
      textAlign: TextAlign.start,
    );
  }

  static Widget sale(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1,
        color: AppColors.greenColor,
      ),
      textAlign: TextAlign.start,
    );
  }
}