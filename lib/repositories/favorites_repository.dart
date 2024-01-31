import 'package:coffee_shop/model/coffee.dart';

class FavoritesRepository {
  final List<Coffee> _favorites = [];

  List<Coffee> addFavorites(Coffee coffee) {
    _favorites.add(coffee);
    return _favorites;
  }

  List<Coffee> removeFavorites(Coffee coffee) {
    _favorites.remove(coffee);
    return _favorites;
  }
}
