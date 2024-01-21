import 'package:coffee_shop/model/product.dart';

class ProductRepository {
  final List<Product> _products = [];

  List<Product> loadClients() {
    _products.addAll([
      Product(name: 'José Armando', id: 1, value: '10'),
      Product(name: 'Joaasé Armando', id: 12, value: '100'),
    ]);
    return _products;
  }

  List<Product> addProduct(Product product) {
    _products.add(product);
    return _products;
  }

  List<Product> removeProduct(Product product) {
    _products.remove(product);
    return _products;
  }
}
