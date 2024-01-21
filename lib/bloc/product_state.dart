import 'package:coffee_shop/model/product.dart';

abstract class ProductState {
  ProductState({
    required this.products,
  });
  List<Product> products;

  ProductState copyWith({
    List<Product>? products,
  });
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super(products: []);

  @override
  ProductInitialState copyWith({
    List<Product>? products,
  }) {
    return ProductInitialState()..products = products ?? this.products;
  }
}

class ProductSuccessState extends ProductState {
  ProductSuccessState({required super.products});

  @override
  ProductSuccessState copyWith({
    List<Product>? products,
  }) {
    return ProductSuccessState(products: products ?? this.products);
  }
}

class StoreState {
  const StoreState({
    this.products = const [],
  });

  final List<Product> products;

  StoreState copyWith({
    List<Product>? products,
  }) =>
      StoreState(
        products: products ?? this.products,
      );
}
