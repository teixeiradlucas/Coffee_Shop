import 'package:coffee_shop/bloc/favorites_bloc.dart';
import 'package:coffee_shop/bloc/favorites_events.dart';
import 'package:coffee_shop/bloc/favorites_state.dart';
import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:coffee_shop/model/coffee.dart';
import 'package:coffee_shop/view/components/show_snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesButton extends StatefulWidget {
  const FavoritesButton({
    required this.itemCoffees,
    super.key,
  });
  final Coffee itemCoffees;

  @override
  State<FavoritesButton> createState() => _FavoritesButtonState();
}

class _FavoritesButtonState extends State<FavoritesButton> {
  void _addFavorites(Coffee coffee) {
    context.read<FavoritesBloc>().add(
          AddFavoritesEvent(coffee: coffee),
        );
  }

  void _removeFavorites(Coffee coffee) {
    context.read<FavoritesBloc>().add(
          RemoveFavoritesEvent(coffee: coffee),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        final isFavorite = (state is FavoritesSuccessState) &&
            state.coffee.contains(widget.itemCoffees);
        return IconButton(
          onPressed: () async {
            if (isFavorite) {
              _removeFavorites(widget.itemCoffees);
              ScaffoldMessenger.of(context).showSnackBar(
                showSnack(StringsGeneric.removeFavorites),
              );
            } else {
              _addFavorites(widget.itemCoffees);
              ScaffoldMessenger.of(context).showSnackBar(
                showSnack(StringsGeneric.addFavorites),
              );
            }
          },
          icon: Icon(
            color: isFavorite ? AppColors.redColor : AppColors.whiteColor,
            size: 50,
            isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
        );
      },
    );
  }
}
