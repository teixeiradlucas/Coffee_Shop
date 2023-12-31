import 'package:app_coffee_shop/constants/components/app_dimension.dart';
import 'package:app_coffee_shop/constants/strings/strings_generic.dart';
import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:app_coffee_shop/home/components/coffee_item.dart';
import 'package:app_coffee_shop/model/coffee.dart';
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
          _news(context),
          gap,
          const Text(AppStringsGeneric.bestSellers),
          gapM,
          _bestSellers(items),
          _category(context),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Center(
        child: Text(AppStringsGeneric.appName),
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
      width: screenWidth - 10,
      child: const Row(
        children: [
          Column(
            children: [
              Text(
                'Espresso irresistível, momentos inesquecíveis.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

SizedBox _bestSellers(List<Coffee> items) {
  return SizedBox(
    height: 200,
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final coffe = items[index];
        return CoffeeItem(
          title: coffe.name,
          type: coffe.beverageType,
          price: coffe.price.toString(),
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
          child: const Text('Processador'),
        ),
        TextButton(onPressed: () {}, child: const Text('Placa mãe')),
        TextButton(onPressed: () {}, child: const Text('Placa de vídeo')),
        TextButton(onPressed: () {}, child: const Text('Memória ram')),
        TextButton(onPressed: () {}, child: const Text('Gabinete')),
        TextButton(onPressed: () {}, child: const Text('Processador')),
      ],
    ),
  );
}
