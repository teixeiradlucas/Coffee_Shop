import 'package:app_coffee_shop/constants/components/app_dimension.dart';
import 'package:app_coffee_shop/constants/components/custom_text.dart';
import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:app_coffee_shop/model/coffee.dart';
import 'package:app_coffee_shop/view/home/components/price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeView extends StatelessWidget {
  const CoffeeView({
    required this.idCoffe,
    super.key,
  });

  final String idCoffe;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemCoffees = coffees
        .where((coffee) => coffee.id.toString() == idCoffe)
        .toList()
        .first;
    final realPrice = finalPrice(itemCoffees);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _coffeeContent(size, itemCoffees, context),
          Padding(
            padding: const EdgeInsets.all(AppDimens.kDefaultPadding),
            child: CustomText.h1('Tamanho'),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimens.kDefaultPadding),
            child: _sizeCoffee(size, Container()),
          ),
          _buy(realPrice, size),
        ],
      ),
    );
  }

  ClipRRect _sizeCoffee(
    Size size,
    Widget child, {
    double padding = AppDimens.kPaddingXXL,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(padding),
      child: Container(
        color: AppColors.whiteColor,
        width: size.width,
        height: 60,
        child: child,
      ),
    );
  }

  ClipRRect _buy(String realPrice, Size size) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppDimens.kPaddingXL),
        topRight: Radius.circular(AppDimens.kPaddingXL),
      ),
      child: Container(
        height: size.height * 0.15,
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.kPaddingM),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText.h2('PREÇO'),
                  CustomText.h1(realPrice),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.kDefaultPadding),
                child: Container(
                  color: AppColors.brownCoffeeColor,
                  height: size.height * 0.08,
                  width: size.width * 0.6,
                  child: Center(
                    child: CustomText.h2(
                      'Adicionar ao carrinho',
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _coffeeContent(
    Size size,
    Coffee itemCoffees,
    BuildContext context,
  ) {
    final intensity = itemCoffees.intensity;
    return SizedBox(
      height: size.height * 0.55,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppDimens.kPaddingXL),
                bottomRight: Radius.circular(AppDimens.kPaddingXL),
              ),
              child: SizedBox(
                height: size.height * 0.55,
                width: size.width,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(itemCoffees.imageAssets),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimens.kPadding),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: _borderContainer(
                      const Icon(
                        Icons.arrow_back,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: _borderContainer(
                      const Icon(
                        Icons.shopping_bag,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                AppDimens.kPaddingXL,
              ),
              child: Container(
                height: 150,
                color: AppColors.blackColor.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText.h3(itemCoffees.name),
                      CustomText.h2(
                        itemCoffees.beverageType,
                        color: AppColors.grayColor,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.yellowColor,
                            size: 30,
                          ),
                          Expanded(child: CustomText.h3('4.5')),
                          _borderContainer(
                            SvgPicture.asset(
                              'assets/icons/GraoIcon.svg',
                              height: 30,
                              width: 30,
                            ),
                            size: 40,
                            color: AppColors.whiteColor,
                          ),
                          _borderContainer(
                            CustomText.h1(
                              intensity.toString(),
                              color: intensity >= 7
                                  ? AppColors.redColor
                                  : AppColors.blackColor,
                            ),
                            size: 40,
                            color: AppColors.whiteColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _borderContainer(
    Widget child, {
    Color color = AppColors.blackColor,
    double size = 60.0,
  }) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.kPaddingXS),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppDimens.kDefaultPadding,
        ),
        child: Container(
          height: size,
          width: size,
          color: color.withOpacity(0.5),
          child: Center(child: child),
        ),
      ),
    );
  }
}
