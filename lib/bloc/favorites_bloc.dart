import 'package:coffee_shop/bloc/favorites_events.dart';
import 'package:coffee_shop/bloc/favorites_state.dart';
import 'package:coffee_shop/repositories/favorites_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitialState()) {
    final favoritesRepo = FavoritesRepository();
    on<AddFavoritesEvent>(
      (event, emit) => emit(
        FavoritesSuccessState(
          coffee: favoritesRepo.addFavorites(event.coffee),
        ),
      ),
    );

    on<RemoveFavoritesEvent>(
      (event, emit) => emit(
        FavoritesSuccessState(
          coffee: favoritesRepo.removeFavorites(event.coffee),
        ),
      ),
    );
  }
}
