// ignore_for_file: sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:coffee_shop/bloc/product_events.dart';
import 'package:coffee_shop/bloc/product_state.dart';
import 'package:coffee_shop/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final _productRepo = ProductRepository();

  ProductBloc() : super(ProductInitialState()) {
    on<LoadProductEvent>(
      (event, emit) =>
          emit(ProductSuccessState(products: _productRepo.loadClients())),
    );
    on<AddProductEvent>(
      (event, emit) => emit(
        ProductSuccessState(
          products: _productRepo.addProduct(event.product),
        ),
      ),
    );

    on<RemoveProductEvent>(
      (event, emit) => emit(
        ProductSuccessState(
          products: _productRepo.removeProduct(event.product),
        ),
      ),
    );
  }
}
