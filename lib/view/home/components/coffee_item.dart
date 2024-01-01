import 'package:app_coffee_shop/constants/components/app_dimension.dart';
import 'package:app_coffee_shop/constants/components/app_text.dart';
import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CoffeeItem extends StatelessWidget {
  const CoffeeItem({
    required this.title,
    required this.type,
    required this.price,
    required this.imageAssets,
    required this.bestSellers,
    super.key,
  });

  final String title;
  final String type;
  final String price;
  final String imageAssets;
  final bool bestSellers;

  @override
  Widget build(BuildContext context) {
    var discountMessage = '';
    if (type == 'Espresso') {
      discountMessage = '20% OFF';
    } else if (type == 'Cappuccino') {
      discountMessage = '12% OFF';
    }
    return Padding(
      padding: const EdgeInsets.all(AppDimens.kPaddingM),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.kDefaultPadding),
        child: Container(
          height: 200,
          width: 130,
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppDimens.kDefaultPadding),
                  child: SizedBox(
                    height: 115,
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
                AppText.body(title),
                gapS,
                AppText.descrition(type),
                gapM,
                Row(
                  children: [
                    AppText.body(price),
                    gapM,
                    AppText.sale(discountMessage),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
