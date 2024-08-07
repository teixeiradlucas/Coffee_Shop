import 'package:coffee_shop/bloc/product_bloc.dart';
import 'package:coffee_shop/bloc/product_events.dart';
import 'package:coffee_shop/constants/components/dimension_custom.dart';
import 'package:coffee_shop/constants/components/text_custom.dart';
import 'package:coffee_shop/constants/strings/routes_generic.dart';
import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                  gap,
                  TextCustom.h1(StringsGeneric.orderSucessfull),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kPaddingXL),
              child: ElevatedButton(
                onPressed: () {
                  context.read<ProductBloc>().add(CleanListProductEvent());
                  GoRouter.of(context).go(RoutesGeneric.homeRoute);
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.whiteColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: TextCustom.h2(
                    StringsGeneric.newOrder,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
