import 'package:coffee_shop/bloc/product_bloc.dart';
import 'package:coffee_shop/bloc/product_events.dart';
import 'package:coffee_shop/constants/components/dimension_custom.dart';
import 'package:coffee_shop/constants/components/text_custom.dart';
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
      padding: const EdgeInsets.all(kPaddingM),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
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
                      TextCustom.h4(itemCoffee.name),
                      TextCustom.h4(
                        color: AppColors.redColor,
                        widget.itemProduct.size,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom.h4(realPrice),
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
      padding: const EdgeInsets.only(bottom: kPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        child: ColoredBox(
          color: AppColors.backgroundColor,
          child: Row(
            children: [
              IconButton(
                onPressed: () => _removeProduct(widget.itemProduct),
                icon: const Icon(Icons.remove),
              ),
              gapS,
              TextCustom.h4(widget.itemProduct.quantity.toString()),
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
