import 'package:app_coffee_shop/constants/components/app_dimension.dart';
import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CoffeeItem extends StatelessWidget {
  const CoffeeItem({
    required this.title,
    required this.type,
    required this.price,
    super.key,
  });

  final String title;
  final String type;
  final String price;

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
                child: Image.network(
                  'https://p2.trrsf.com/image/fget/cf/1200/900/middle/images.terra.com/2023/04/13/2081474064-beneficios-do-cafe.jpg',
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
