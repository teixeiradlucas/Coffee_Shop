import 'package:coffee_shop/model/product.dart';

abstract class ProductEvent {}

class AddProductEvent extends ProductEvent {
  AddProductEvent({required this.product});

  Product product;
}

class RemoveProductEvent extends ProductEvent {
  RemoveProductEvent({required this.product});

  Product product;
}
