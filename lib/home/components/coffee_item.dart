import 'package:app_coffee_shop/constants/components/app_dimension.dart';
import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CoffeeItem extends StatelessWidget {
  const CoffeeItem({
    required this.title,
    required this.type,
    required this.price,
    required this.imageAssets,
    super.key,
  });

  final String title;
  final String type;
  final String price;
  final String imageAssets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 200,
          width: 130,
          color: AppColors.brownCoffeeColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 100,
                  width: 130,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset(
                      imageAssets,
                    ),
                  ),
                ),
              ),
              gapM,
              Text(title),
              gapM,
              Text(type),
              gapM,
              Text(price),
            ],
          ),
        ),
      ),
    );
  }
}
