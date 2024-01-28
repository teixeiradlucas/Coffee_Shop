import 'package:coffee_shop/constants/components/dimension_custom.dart';
import 'package:coffee_shop/constants/components/text_custom.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:coffee_shop/model/coffee.dart';
import 'package:coffee_shop/view/components/image_coffee.dart';
import 'package:coffee_shop/view/components/price.dart';
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
        padding: const EdgeInsets.all(kPaddingM),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          child: Container(
            height: 150,
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageCoffee(
                    itemCoffee: itemCoffee,
                    height: 145,
                    width: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustom.h4(itemCoffee.name),
                        TextCustom.descrition(itemCoffee.beverageType),
                        Row(
                          children: [
                            TextCustom.h2(realPrice),
                            gapM,
                            TextCustom.sale(discountMessage),
                            gapM,
                            TextCustom.discount(
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
                            TextCustom.h4(
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
