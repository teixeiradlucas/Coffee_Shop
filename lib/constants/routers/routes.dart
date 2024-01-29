import 'package:coffee_shop/constants/strings/routes_generic.dart';
import 'package:coffee_shop/view/cart/cart_finish_view.dart';
import 'package:coffee_shop/view/cart/cart_view.dart';
import 'package:coffee_shop/view/coffee/coffee_view.dart';
import 'package:coffee_shop/view/favorites/favorites_view.dart';
import 'package:coffee_shop/view/home/home_coffee_view.dart';
import 'package:coffee_shop/view/home/home_view.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      name: RoutesGeneric.homeName,
      path: RoutesGeneric.homeRoute,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      name: RoutesGeneric.homeCoffeeName,
      path: RoutesGeneric.homeCoffeeRoute,
      builder: (context, state) => const HomeCoffeeView(),
    ),
    GoRoute(
      name: RoutesGeneric.coffeeViewName,
      path: '${RoutesGeneric.coffeeViewRoute}:id',
      builder: (context, state) => CoffeeView(
        idCoffe: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      name: RoutesGeneric.favoritesName,
      path: RoutesGeneric.favoritesRoute,
      builder: (context, state) => const FavoritesView(),
    ),
    GoRoute(
      name: RoutesGeneric.cartName,
      path: RoutesGeneric.cartRoute,
      builder: (context, state) => const CartView(),
    ),
    GoRoute(
      name: RoutesGeneric.cartFinishName,
      path: RoutesGeneric.cartFinishRoute,
      builder: (context, state) => const CartFinishView(),
    ),
  ],
);
