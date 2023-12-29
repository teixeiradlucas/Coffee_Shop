import 'package:app_coffee_shop/constants/strings/strings_generic.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStringsGeneric.nameChipset),
      ),
      body: const SizedBox(),
    );
  }
}
