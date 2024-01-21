import 'package:coffee_shop/bloc/product_bloc.dart';
import 'package:coffee_shop/bloc/product_events.dart';
import 'package:coffee_shop/bloc/product_state.dart';
import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:coffee_shop/model/product.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  late final ProductBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ProductBloc>(context);
  }

  @override
  Future<void> dispose() async {
    await bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStringsGeneric.favorites),
        actions: [
          ElevatedButton(
            onPressed: () {
              bloc.add(
                AddProductEvent(
                  product: Product(
                    name: 'coffee.name',
                    id: 1,
                    value: 'finalPrice(coffee)',
                  ),
                ),
              );
            },
            child: const Text('aa'),
          ),
        ],
      ),
      body: SizedBox(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
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
                    onPressed: () {
                      bloc.add(
                        RemoveProductEvent(product: productsList[index]),
                      );
                    },
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
