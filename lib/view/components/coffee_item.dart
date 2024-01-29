import 'package:coffee_shop/constants/components/dimension_custom.dart';
import 'package:coffee_shop/constants/components/text_custom.dart';
import 'package:coffee_shop/constants/strings/routes_generic.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:coffee_shop/model/coffee.dart';
import 'package:coffee_shop/view/components/image_coffee.dart';
import 'package:coffee_shop/view/components/price.dart';
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
      onTap: () async => GoRouter.of(context)
          .push('${RoutesGeneric.coffeeViewRoute}${itemCoffee.id}'),
      child: Padding(
        padding: const EdgeInsets.all(kPaddingM),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          child: Container(
            height: 200,
            width: 130,
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ImageCoffee(
                        itemCoffee: itemCoffee,
                        height: 115,
                        width: 130,
                      ),
                      Positioned(
                        right: 3,
                        top: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kPaddingM),
                          child: Container(
                            width: 50,
                            color: AppColors.whiteColor,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.yellowColor,
                                  size: 20,
                                ),
                                TextCustom.h4(
                                  itemCoffee.rating.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  gapM,
                  TextCustom.body(itemCoffee.name),
                  gapS,
                  TextCustom.descrition(itemCoffee.beverageType),
                  gapM,
                  Row(
                    children: [
                      TextCustom.body(realPrice),
                      gapM,
                      TextCustom.sale(discountMessage),
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
