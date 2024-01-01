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
      title: Center(
        child: AppText.h1(AppStringsGeneric.appName),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shop_2_rounded),
        ),
      ],
    );
  }

  Container _news(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brownCoffeeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: screenWidth - 20,
      child: Row(
        children: [
          Column(
            children: [
              AppText.h2('Espresso irresistível, \nmomentos inesquecíveis.'),
            ],
          ),
          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset('assets/images/coffeenew.png'),
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
        final coffe = activeCoffees[index];
        final realPrice = formattedPrice(coffe.price);
        return CoffeeItem(
          title: coffe.name,
          type: coffe.beverageType,
          price: realPrice,
          imageAssets: coffe.imageAssets,
        );
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

String formattedPrice(double valor) {
  var valorString = valor.toStringAsFixed(2);
  valorString = valorString.replaceAll('.', ',');
  valorString = 'R\$ $valorString';

  return valorString;
}
