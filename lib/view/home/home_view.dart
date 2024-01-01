import 'package:app_coffee_shop/constants/components/app_dimension.dart';
import 'package:app_coffee_shop/constants/components/app_text.dart';
import 'package:app_coffee_shop/constants/strings/strings_generic.dart';
import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:app_coffee_shop/model/coffee.dart';
import 'package:app_coffee_shop/view/home/components/coffee_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = coffees;
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          gap,
          _news(context),
          gap,
          AppText.h1(AppStringsGeneric.bestSellers),
          gapM,
          _bestSellers(items),
          _category(context),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Center(child: AppText.h1(AppStringsGeneric.appName)),
    );
  }

  Container _news(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brownCoffeeColor,
        borderRadius: BorderRadius.circular(AppDimens.kDefaultPadding),
      ),
      height: 180,
      width: screenWidth - 20,
      child: Stack(
        children: [
          Positioned(
            top: 35,
            left: 20,
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  width: screenWidth * 0.65,
                  child: AppText.h2(
                    'Espresso irresistível, momentos inesquecíveis.',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppDimens.kPaddingM),
              ),
              child: Center(child: AppText.h1('ATÉ 20% OFF')),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 0,
            child: SizedBox(
              height: 120,
              width: screenWidth * 0.3,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Image.asset('assets/images/coffeenew.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

SizedBox _bestSellers(List<Coffee> items) {
  final activeCoffees =
      items.where((coffee) => coffee.isAtive && coffee.bestSellers).toList();

  return SizedBox(
    height: 200,
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: activeCoffees.length,
      itemBuilder: (context, index) {
        final coffee = activeCoffees[index];
        return CoffeeItem(itemCoffee: coffee);
      },
    ),
  );
}

SingleChildScrollView _category(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        TextButton(
          onPressed: () async => GoRouter.of(context).push('/favorites'),
          child: const Text('Cappuccino'),
        ),
        TextButton(onPressed: () {}, child: const Text('Espresso')),
        TextButton(onPressed: () {}, child: const Text('Latte')),
        TextButton(onPressed: () {}, child: const Text('Mocha')),
      ],
    ),
  );
}
