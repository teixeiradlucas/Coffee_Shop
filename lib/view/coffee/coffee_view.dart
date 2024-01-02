import 'package:app_coffee_shop/constants/components/custom_text.dart';
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
    final items = coffees;
    final id = int.parse(idCoffe);
    final itemCoffees = items.where((coffee) => coffee.id == id).toList();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomText.h1(itemCoffees[0].name),
          CustomText.body(itemCoffees[0].intensity.toString()),
        ],
      ),
    );
  }
}
