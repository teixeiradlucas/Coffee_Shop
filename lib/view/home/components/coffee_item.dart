import 'package:app_coffee_shop/constants/components/app_dimension.dart';
import 'package:app_coffee_shop/constants/components/custom_text.dart';
import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:app_coffee_shop/model/coffee.dart';
import 'package:app_coffee_shop/view/home/components/price.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoffeeItem extends StatelessWidget {
  const CoffeeItem({
    required this.itemCoffee,
    super.key,
  });

  final Coffee itemCoffee;

  @override
  Widget build(BuildContext context) {
    final realPrice = finalPrice(itemCoffee);
    final discountMessage = textDiscount(itemCoffee);

    return GestureDetector(
      onTap: () async =>
          GoRouter.of(context).push('/coffee_view/${itemCoffee.id}'),
      child: Padding(
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
                        child: Image.asset(itemCoffee.imageAssets),
                      ),
                    ),
                  ),
                  gapM,
                  CustomText.body(itemCoffee.name),
                  gapS,
                  CustomText.descrition(itemCoffee.beverageType),
                  gapM,
                  Row(
                    children: [
                      CustomText.body(realPrice),
                      gapM,
                      CustomText.sale(discountMessage),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
