import 'package:coffee_shop/model/coffee.dart';

abstract class FavoritesState {
  FavoritesState({required this.coffee});
  List<Coffee> coffee;
}

class FavoritesInitialState extends FavoritesState {
  FavoritesInitialState() : super(coffee: []);
}

class FavoritesSuccessState extends FavoritesState {
  FavoritesSuccessState({required super.coffee});
}
