import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/constants/components/custom_text.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:coffee_shop/model/coffee.dart';
import 'package:coffee_shop/view/home/components/price.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoffeeItemType extends StatelessWidget {
  const CoffeeItemType({
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
            height: 150,
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.kPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppDimens.kDefaultPadding),
                    child: SizedBox(
                      height: 145,
                      width: 130,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image.asset(itemCoffee.imageAssets),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppDimens.kPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.h4(itemCoffee.name),
                        CustomText.descrition(itemCoffee.beverageType),
                        Row(
                          children: [
                            CustomText.h2(realPrice),
                            gapM,
                            CustomText.sale(discountMessage),
                            gapM,
                            CustomText.discount(
                              valueDiscount(itemCoffee),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.yellowColor,
                              size: 30,
                            ),
                            CustomText.h4(
                              itemCoffee.rating.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
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
