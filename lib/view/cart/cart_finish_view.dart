import 'package:coffee_shop/bloc/product_bloc.dart';
import 'package:coffee_shop/bloc/product_events.dart';
import 'package:coffee_shop/constants/components/dimension_custom.dart';
import 'package:coffee_shop/constants/components/text_custom.dart';
import 'package:coffee_shop/constants/strings/routes_generic.dart';
import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartFinishView extends StatelessWidget {
  const CartFinishView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
            ),
            gap,
            Center(child: TextCustom.h1(StringsGeneric.orderSucessfull)),
            gapXL,
            ElevatedButton(
              onPressed: () {
                context.read<ProductBloc>().add(CleanListProductEvent());
                GoRouter.of(context).go(RoutesGeneric.homeRoute);
              },
              child: TextCustom.h2(StringsGeneric.newOrder),
            ),
          ],
        ),
      ),
    );
  }
}
