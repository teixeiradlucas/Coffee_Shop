import 'package:coffee_shop/model/coffee.dart';

abstract class FavoritesEvent {}

class AddFavoritesEvent extends FavoritesEvent {
  AddFavoritesEvent({required this.coffee});

  Coffee coffee;
}

class RemoveFavoritesEvent extends FavoritesEvent {
  RemoveFavoritesEvent({required this.coffee});

  Coffee coffee;
}
