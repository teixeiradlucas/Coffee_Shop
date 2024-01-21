import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:coffee_shop/view/favorites_view.dart';
import 'package:coffee_shop/view/home_coffee_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigation(context, pageController),
      body: PageView(
        controller: pageController,
        children: const [
          HomeCoffeeView(),
          FavoritesView(),
        ],
      ),
    );
  }
}

Padding _bottomNavigation(BuildContext context, PageController pageController) {
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
        onTabChange: (index) async {
          await pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
            iconActiveColor: AppColors.whiteColor,
            textColor: AppColors.whiteColor,
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Favoritos',
            //onPressed: () async => GoRouter.of(context).push('/favorites'),
            iconActiveColor: AppColors.whiteColor,
            textColor: AppColors.whiteColor,
          ),
          GButton(
            icon: Icons.shopping_bag,
            text: 'Carrinho',
            iconActiveColor: AppColors.whiteColor,
            textColor: AppColors.whiteColor,
          ),
          GButton(
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