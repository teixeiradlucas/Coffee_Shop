import 'package:app_coffee_shop/constants/components/app_dimension.dart';
import 'package:app_coffee_shop/constants/components/app_text.dart';
import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:app_coffee_shop/model/coffee.dart';
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
    var discountMessage = '';
    if (itemCoffee.beverageType == 'Espresso') {
      discountMessage = '20% OFF';
    } else if (itemCoffee.beverageType == 'Cappuccino') {
      discountMessage = '12% OFF';
    }
    final realPrice = formattedPrice(computarDesconto(itemCoffee));

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
                        child: Image.asset(
                          itemCoffee.imageAssets,
                        ),
                      ),
                    ),
                  ),
                  gapM,
                  AppText.body(itemCoffee.name),
                  gapS,
                  AppText.descrition(itemCoffee.beverageType),
                  gapM,
                  Row(
                    children: [
                      AppText.body(realPrice),
                      gapM,
                      AppText.sale(discountMessage),
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

String formattedPrice(double valor) {
  var valorString = valor.toStringAsFixed(2);
  valorString = valorString.replaceAll('.', ',');
  valorString = 'R\$ $valorString';

  return valorString;
}

double computarDesconto(Coffee coffee) {
  var percentualDesconto = 0.0;
  if (coffee.beverageType == 'Espresso') {
    percentualDesconto = 0.20;
  } else if (coffee.beverageType == 'Cappuccino') {
    percentualDesconto = 0.12;
  }

  final precoComDesconto = coffee.price - (coffee.price * percentualDesconto);

  return precoComDesconto;
}
