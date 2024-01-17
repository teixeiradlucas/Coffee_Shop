import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/constants/components/custom_text.dart';
import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:coffee_shop/model/coffee.dart';
import 'package:coffee_shop/view/components/category_coffee.dart';
import 'package:coffee_shop/view/components/coffee_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeCoffeeView extends StatelessWidget {
  const HomeCoffeeView({super.key});

  @override
  Widget build(BuildContext context) {
    final activeCoffees = coffees.where((coffee) => coffee.isAtive).toList();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: CustomText.h1(AppStringsGeneric.appName)),
      ),
      bottomNavigationBar: _bottomNavigation(context),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _news(context),
            _bestSellers(context, activeCoffees),
            CategoryCoffee(activeCoffees: activeCoffees),
          ],
        ),
      ),
    );
  }

  Container _news(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brownCoffeeColor,
        borderRadius: BorderRadius.circular(AppDimens.kDefaultPadding),
      ),
      height: size.height * 0.18,
      width: size.width - 20,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 20,
            child: SizedBox(
              height: 120,
              width: size.width * 0.65,
              child: CustomText.h2(
                'Espresso irresistível, momentos inesquecíveis.',
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Positioned(
            top: 85,
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
            right: -10,
            bottom: -10,
            child: SizedBox(
              height: 120,
              width: size.width * 0.3,
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

Column _bestSellers(
  BuildContext context,
  List<Coffee> items,
) {
  final size = MediaQuery.of(context).size;
  final bestCoffees = items.where((coffee) => coffee.bestSellers).toList();
  return Column(
    children: [
      gap,
      CustomText.body3(AppStringsGeneric.bestSellers),
      gapM,
      SizedBox(
        height: size.height * 0.27,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: bestCoffees.length,
          itemBuilder: (context, index) {
            final coffee = bestCoffees[index];
            return CoffeeItem(itemCoffee: coffee);
          },
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
        onTabChange: (index) {
          print(index);
        },
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
