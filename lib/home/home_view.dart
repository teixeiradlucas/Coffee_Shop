import 'package:app_coffee_shop/constants/routers/app_routes_name.dart';
import 'package:app_coffee_shop/constants/strings/strings_generic.dart';
import 'package:app_coffee_shop/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.brownCoffeeColor,
              borderRadius:
                  BorderRadius.circular(10.0), // Define o raio das bordas
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
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextButton(
                  onPressed: () =>
                      AppRoutesName.favorites.pushNamedVoid(context),
                  child: const Text('Processador'),
                ),
                TextButton(onPressed: () {}, child: const Text('Placa mãe')),
                TextButton(
                    onPressed: () {}, child: const Text('Placa de vídeo')),
                TextButton(onPressed: () {}, child: const Text('Memória ram')),
                TextButton(onPressed: () {}, child: const Text('Gabinete')),
                TextButton(onPressed: () {}, child: const Text('Processador')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
