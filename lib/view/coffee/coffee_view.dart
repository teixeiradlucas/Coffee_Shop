import 'package:app_coffee_shop/constants/components/app_text.dart';
import 'package:flutter/material.dart';

class CoffeeView extends StatelessWidget {
  const CoffeeView({
    required this.idCoffe,
    super.key,
  });

  final String idCoffe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppText.h1(idCoffe),
          AppText.body('itemCoffee.beverageType'),
        ],
      ),
    );
  }
}
