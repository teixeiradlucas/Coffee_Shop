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

    on<IncrementProductQuantityEvent>(
      (event, emit) {
        for (final product in _productRepo.getProducts()) {
          if (product.coffee.id == event.product.coffee.id &&
              product.size == event.product.size) {
            product.quantity += 1;
            break;
          }
        }
        emit(ProductSuccessState(products: _productRepo.getProducts()));
      },
    );

    on<DecrementProductQuantityEvent>(
      (event, emit) {
        for (final product in _productRepo.getProducts()) {
          if (product.coffee.id == event.product.coffee.id &&
              product.size == event.product.size) {
            if (product.quantity > 0) {
              product.quantity -= 1;

              if (product.quantity <= 0) {
                add(RemoveProductEvent(product: product));
              }
            }
            break;
          }
        }
        emit(ProductSuccessState(products: _productRepo.getProducts()));
      },
    );
  }

  final _productRepo = ProductRepository();
}
