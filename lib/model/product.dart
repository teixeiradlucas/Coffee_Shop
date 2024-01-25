import 'package:coffee_shop/model/coffee.dart';

class Product {
  Product({
    required this.coffee,
    required this.size,
    this.quantity = 1,
  });
  Coffee coffee;
  String size;
  int quantity;
}
