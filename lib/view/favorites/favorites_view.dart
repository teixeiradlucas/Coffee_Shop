import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStringsGeneric.favorites)),
      body: const SizedBox(),
    );
  }
}
