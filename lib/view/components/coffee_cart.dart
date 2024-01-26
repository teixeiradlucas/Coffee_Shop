import 'package:coffee_shop/bloc/product_bloc.dart';
import 'package:coffee_shop/bloc/product_events.dart';
import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/constants/components/custom_text.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:coffee_shop/model/product.dart';
import 'package:coffee_shop/view/components/image_coffee.dart';
import 'package:coffee_shop/view/components/price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCart extends StatefulWidget {
  const CoffeeCart({
    required this.itemProduct,
    super.key,
  });

  final Product itemProduct;

  @override
  State<CoffeeCart> createState() => _CoffeeCartState();
}

class _CoffeeCartState extends State<CoffeeCart> {
  void _removeProduct(Product product) => context.read<ProductBloc>().add(
        DecrementProductQuantityEvent(product: product),
      );
  void _addProduct(Product product) {
    context.read<ProductBloc>().add(
          IncrementProductQuantityEvent(product: product),
        );
  }

  @override
  Widget build(BuildContext context) {
    final itemCoffee = widget.itemProduct.coffee;
    final realPrice = finalPrice(itemCoffee);

    return Padding(
      padding: const EdgeInsets.all(AppDimens.kPaddingM),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.kDefaultPadding),
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.kPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageCoffee(
                  itemCoffee: itemCoffee,
                  height: 115,
                  width: 110,
                ),
                gap,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.h4(itemCoffee.name),
                      CustomText.h4(color: AppColors.redColor, 'Pequeno'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText.h4(realPrice),
                          _amountCoffee(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _amountCoffee() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.kPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.kDefaultPadding),
        child: ColoredBox(
          color: AppColors.backgroundColor,
          child: Row(
            children: [
              IconButton(
                onPressed: () => _removeProduct(widget.itemProduct),
                icon: const Icon(Icons.remove),
              ),
              gapS,
              CustomText.h4(widget.itemProduct.quantity.toString()),
              gapS,
              IconButton(
                onPressed: () => _addProduct(widget.itemProduct),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
