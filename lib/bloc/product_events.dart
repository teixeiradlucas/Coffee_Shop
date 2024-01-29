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

class CleanListProductEvent extends ProductEvent {
  CleanListProductEvent();
}

class IncrementProductQuantityEvent extends ProductEvent {
  IncrementProductQuantityEvent({required this.product});

  Product product;
}

class DecrementProductQuantityEvent extends ProductEvent {
  DecrementProductQuantityEvent({required this.product});

  Product product;
}
