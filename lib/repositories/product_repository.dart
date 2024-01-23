import 'package:coffee_shop/model/product.dart';

class ProductRepository {
  final List<Product> _products = [];

  List<Product> addProduct(Product product) {
    _products.add(product);
    return _products;
  }

  List<Product> removeProduct(Product product) {
    _products.remove(product);
    return _products;
  }
}
