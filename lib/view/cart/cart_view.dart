import 'package:coffee_shop/bloc/product_bloc.dart';
import 'package:coffee_shop/bloc/product_events.dart';
import 'package:coffee_shop/bloc/product_state.dart';
import 'package:coffee_shop/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  void _removeToCart(Product product) => context.read<ProductBloc>().add(
        RemoveProductEvent(product: product),
      );

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
                  return ListView.separated(
                    itemCount: productsList.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Text(productsList[index].name.substring(0, 1)),
                        ),
                      ),
                      title: Text(productsList[index].name),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => _removeToCart(productsList[index]),
                      ),
                    ),
                    separatorBuilder: (_, __) => const Divider(),
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
