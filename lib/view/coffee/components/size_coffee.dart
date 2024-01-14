import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/constants/components/custom_text.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SizeCoffee extends StatelessWidget {
  const SizeCoffee({
    required this.text,
    super.key,
    this.color = AppColors.whiteColor,
    this.padding = AppDimens.kPaddingXXL,
  });

  final Color color;
  final double padding;
  final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(padding),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(padding),
        child: Container(
          color: color,
          width: width * 0.3,
          height: 50,
          child: Center(
            child: CustomText.h2(text),
          ),
        ),
      ),
    );
  }
}
