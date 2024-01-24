import 'package:coffee_shop/model/coffee.dart';

class Product {
  Product({
    required this.coffee,
    required this.size,
  });
  Coffee coffee;
  String size;
}
