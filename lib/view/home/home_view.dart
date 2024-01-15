import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/constants/components/custom_text.dart';
import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:coffee_shop/model/coffee.dart';
import 'package:coffee_shop/view/home/components/coffe_item_type.dart';
import 'package:coffee_shop/view/home/components/coffee_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = coffees;
    final activeCoffees = items.where((coffee) => coffee.isAtive).toList();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigation(context),
      body: Column(
        children: [
          _news(context, size.height * 0.18),
          _bestSellers(items, size.height * 0.25),
          _category(context, activeCoffees, size.height * 0.28),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Center(child: CustomText.h1(AppStringsGeneric.appName)),
    );
  }

  Container _news(BuildContext context, double height) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brownCoffeeColor,
        borderRadius: BorderRadius.circular(AppDimens.kDefaultPadding),
      ),
      height: height,
      width: screenWidth - 20,
      child: Stack(
        children: [
          Positioned(
            top: 35,
            left: 20,
            child: SizedBox(
              height: 120,
              width: screenWidth * 0.65,
              child: CustomText.h2(
                'Espresso irresistível, momentos inesquecíveis.',
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Container(
              width: 150,
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppDimens.kPaddingM),
              ),
              child: Center(child: CustomText.body3('ATÉ 20% OFF')),
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

Column _bestSellers(List<Coffee> items, double height) {
  final activeCoffees =
      items.where((coffee) => coffee.isAtive && coffee.bestSellers).toList();
  return Column(
    children: [
      gap,
      CustomText.body3(AppStringsGeneric.bestSellers),
      gapM,
      SizedBox(
        height: height,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: activeCoffees.length,
          itemBuilder: (context, index) {
            final coffee = activeCoffees[index];
            return CoffeeItem(itemCoffee: coffee);
          },
        ),
      ),
    ],
  );
}

Column _category(
  BuildContext context,
  List<Coffee> activeCoffees,
  double height,
) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(onPressed: () {}, child: const Text('Cappuccino')),
          TextButton(onPressed: () {}, child: const Text('Espresso')),
          TextButton(onPressed: () {}, child: const Text('Latte')),
          TextButton(onPressed: () {}, child: const Text('Mocha')),
        ],
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.kPaddingXL),
        child: SizedBox(
          height: height,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: activeCoffees.length,
            itemBuilder: (context, index) {
              final coffee = activeCoffees[index];
              return CoffeeItemType(itemCoffee: coffee);
            },
          ),
        ),
      ),
    ],
  );
}

Padding _bottomNavigation(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(AppDimens.kPaddingS),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.kPaddingXL),
      ),
      child: GNav(
        backgroundColor: AppColors.whiteColor,
        tabBackgroundColor: AppColors.brownCoffeeColor,
        padding: const EdgeInsets.all(AppDimens.kPadding * 2),
        gap: 8,
        tabs: [
          const GButton(
            icon: Icons.home,
            text: 'Home',
            iconActiveColor: AppColors.whiteColor,
            textColor: AppColors.whiteColor,
          ),
          GButton(
            onPressed: () async => GoRouter.of(context).push('/favorites'),
            icon: Icons.favorite,
            text: 'Favoritos',
            iconActiveColor: AppColors.whiteColor,
            textColor: AppColors.whiteColor,
          ),
          const GButton(
            icon: Icons.shopping_bag,
            text: 'Carrinho',
            iconActiveColor: AppColors.whiteColor,
            textColor: AppColors.whiteColor,
          ),
          const GButton(
            icon: Icons.discount,
            text: 'Oferta',
            iconActiveColor: AppColors.whiteColor,
            textColor: AppColors.whiteColor,
          ),
        ],
      ),
    ),
  );
}
