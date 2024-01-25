import 'package:bloc/bloc.dart';
import 'package:coffee_shop/bloc/product_events.dart';
import 'package:coffee_shop/bloc/product_state.dart';
import 'package:coffee_shop/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<AddProductEvent>(
      (event, emit) {
        var productExists = false;
        for (final product in _productRepo.getProducts()) {
          if (product.coffee.id == event.product.coffee.id &&
              product.size == event.product.size) {
            product.quantity += event.product.quantity;
            productExists = true;
            break;
          }
        }

        if (!productExists) {
          _productRepo.addProduct(event.product);
        }

        emit(ProductSuccessState(products: _productRepo.getProducts()));
      },
    );
    on<RemoveProductEvent>(
      (event, emit) => emit(
        ProductSuccessState(
          products: _productRepo.removeProduct(event.product),
        ),
      ),
    );
  }

  final _productRepo = ProductRepository();
}
