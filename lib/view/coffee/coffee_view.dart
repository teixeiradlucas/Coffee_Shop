import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/constants/components/custom_text.dart';
import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:coffee_shop/model/coffee.dart';
import 'package:coffee_shop/view/coffee/components/border_container.dart';
import 'package:coffee_shop/view/coffee/components/size_coffee.dart';
import 'package:coffee_shop/view/home/components/price.dart';
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
        children: [
          _coffeeContent(size, itemCoffees, context),
          _descrition(itemCoffees),
          _buy(realPrice, size),
        ],
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
      height: size.height * 0.60,
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
                height: size.height * 0.60,
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
                    child: const BorderContainer(
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      //TODO:NAVEGAR PARA TELA DO CARRINHO
                    },
                    //TODO:ADICIONAR NUMERO DE ITENS NO CARRINHO
                    child: const BorderContainer(
                      child: Icon(
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
                      Row(
                        children: [
                          Expanded(child: CustomText.h3(itemCoffees.name)),
                          IconButton(
                            onPressed: () {},
                            //TODO:IMPLEMENTAR FAVORITOS E ANIMAÇÃO
                            icon: const Icon(
                              color: AppColors.redColor,
                              size: 40,
                              Icons.favorite,
                            ),
                          ),
                        ],
                      ),
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
                          Expanded(
                            child: CustomText.h3(
                              itemCoffees.rating.toString(),
                            ),
                          ),
                          BorderContainer(
                            size: 40,
                            color: AppColors.whiteColor,
                            child: SvgPicture.asset(
                              'assets/icons/GraoIcon.svg',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          BorderContainer(
                            size: 40,
                            color: AppColors.whiteColor,
                            child: CustomText.h1(
                              intensity.toString(),
                              color: intensity >= 7
                                  ? AppColors.redColor
                                  : AppColors.blackColor,
                            ),
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

  Padding _descrition(Coffee itemCoffees) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.kPaddingM),
      child: Column(
        children: [
          CustomText.h1(AppStringsGeneric.descrition),
          gap,
          CustomText.body(itemCoffees.description),
        ],
      ),
    );
  }

  Column _buy(String realPrice, Size size) {
    //TODO:ADICIONAR CONTROLLER PARA SELECIONAR TAMANHO E MUDAR O PREÇO
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(AppDimens.kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizeCoffee(
                color: AppColors.beigeColor,
                text: AppStringsGeneric.small,
              ),
              SizeCoffee(
                text: AppStringsGeneric.medium,
              ),
              SizeCoffee(
                text: AppStringsGeneric.big,
              ),
            ],
          ),
        ),
        ClipRRect(
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
                      CustomText.h2(AppStringsGeneric.price),
                      CustomText.h1(realPrice),
                    ],
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppDimens.kDefaultPadding),
                    child: Container(
                      color: AppColors.brownCoffeeColor,
                      height: size.height * 0.08,
                      width: size.width * 0.6,
                      child: Center(
                        child: CustomText.h2(
                          AppStringsGeneric.addCart,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
