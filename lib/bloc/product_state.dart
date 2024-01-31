import 'package:coffee_shop/model/product.dart';

abstract class ProductState {
  ProductState({required this.products});
  List<Product> products;
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super(products: []);
}

class ProductSuccessState extends ProductState {
  ProductSuccessState({required super.products});
}
