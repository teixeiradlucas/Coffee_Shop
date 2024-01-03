import 'package:app_coffee_shop/constants/components/app_dimension.dart';
import 'package:app_coffee_shop/constants/components/custom_text.dart';
import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:app_coffee_shop/model/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeView extends StatelessWidget {
  const CoffeeView({
    required this.idCoffe,
    super.key,
  });

  final String idCoffe;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final items = coffees;
    final id = int.parse(idCoffe);
    final itemCoffees = items.where((coffee) => coffee.id == id).toList();
    return Scaffold(
      body: Stack(
        children: [
          _image(size, itemCoffees),
          _buttonBack(context),
          _descrition(size, itemCoffees),
        ],
      ),
    );
  }

  Positioned _descrition(Size size, List<Coffee> itemCoffees) {
    return Positioned(
      top: size.height * 0.45,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppDimens.kPaddingXL,
        ),
        child: Container(
          width: size.width,
          height: 150,
          color: AppColors.blackColor.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText.h3(itemCoffees[0].name),
                CustomText.h2(itemCoffees[0].beverageType),
                Row(
                  children: [
                    Expanded(child: CustomText.h2('Intensidade 5')),
                    const Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                      size: 30,
                    ),
                    CustomText.h3('4.5'),
                    gap,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _image(Size size, List<Coffee> itemCoffees) {
    return Positioned(
      top: -25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppDimens.kPaddingXL,
        ),
        child: SizedBox(
          width: size.width,
          height: size.height * 0.64,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(itemCoffees[0].imageAssets),
          ),
        ),
      ),
    );
  }

  Positioned _buttonBack(BuildContext context) {
    return Positioned(
      top: 5,
      left: 5,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            AppDimens.kPaddingXL,
          ),
          child: Container(
            height: 50,
            width: 50,
            color: AppColors.blackColor.withOpacity(0.5),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
