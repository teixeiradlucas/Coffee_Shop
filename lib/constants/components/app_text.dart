import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:app_coffee_shop/constants/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  factory AppText.h1(
    String text, {
    TextAlign textAlign = TextAlign.start,
  }) {
    return AppText._(
      text,
      const TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.5,
        color: AppColors.blackColor,
      ),
      maxLines: 3,
      textAlign: textAlign,
    );
  }
  factory AppText.h2(
    String text, {
    TextAlign textAlign = TextAlign.start,
  }) {
    return AppText._(
      text,
      const TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.5,
        color: AppColors.whiteColor,
      ),
      maxLines: 3,
      textAlign: textAlign,
    );
  }

  factory AppText.body(
    String text, {
    TextAlign textAlign = TextAlign.start,
  }) {
    return AppText._(
      text,
      const TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1,
        color: AppColors.blackColor,
      ),
      textAlign: textAlign,
    );
  }

  factory AppText.descrition(
    String text, {
    TextAlign textAlign = TextAlign.start,
  }) {
    return AppText._(
      text,
      const TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        height: 1,
        color: Color.fromARGB(255, 80, 80, 80),
      ),
      textAlign: textAlign,
    );
  }

  factory AppText.sale(
    String text, {
    TextAlign textAlign = TextAlign.start,
  }) {
    return AppText._(
      text,
      const TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1,
        color: AppColors.greenColor,
      ),
      textAlign: textAlign,
    );
  }

  const AppText._(
    this.text,
    this.textStyle, {
    this.textAlign = TextAlign.left,
    this.maxLines = 1,
  });

  final String text;
  final TextStyle textStyle;
  final int? maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
