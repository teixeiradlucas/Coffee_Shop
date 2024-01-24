import 'package:coffee_shop/bloc/product_bloc.dart';
import 'package:coffee_shop/bloc/product_state.dart';
import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/view/components/coffee_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductInitialState) {
                  return const Center(
                    child: Text('Lista de favoritos esta vazia'),
                  );
                } else if (state is ProductSuccessState) {
                  final productsList = state.products;
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimens.kPaddingXL),
                    child: SizedBox(
                      height: 200, //size.height * 0.28,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: productsList.length,
                        itemBuilder: (context, index) {
                          return CoffeeCart(
                            itemProduct: productsList[index],
                          );
                        },
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
