import 'package:coffee_shop/constants/components/text_custom.dart';
import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextCustom.h1(StringsGeneric.favoritesTitle),
      ),
      body: const SizedBox(),
    );
  }
}
