import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/model/coffee.dart';
import 'package:flutter/material.dart';

class ImageCoffee extends StatelessWidget {
  const ImageCoffee({
    required this.itemCoffee,
    required this.height,
    required this.width,
    super.key,
  });

  final Coffee itemCoffee;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.kDefaultPadding),
      child: SizedBox(
        height: height,
        width: width,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Image.asset(itemCoffee.imageAssets),
        ),
      ),
    );
  }
}
