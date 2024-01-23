import 'package:coffee_shop/view/cart/cart_view.dart';
import 'package:coffee_shop/view/coffee/coffee_view.dart';
import 'package:coffee_shop/view/favorites/favorites_view.dart';
import 'package:coffee_shop/view/home/home_coffee_view.dart';
import 'package:coffee_shop/view/home/home_view.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      name: 'Home',
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      name: 'Home Coffee',
      path: '/home_coffee',
      builder: (context, state) => const HomeCoffeeView(),
    ),
    GoRoute(
      name: 'Coffee View',
      path: '/coffee_view/:id',
      builder: (context, state) => CoffeeView(
        idCoffe: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      name: 'Favorites',
      path: '/favorites',
      builder: (context, state) => const FavoritesView(),
    ),
    GoRoute(
      name: 'Cart',
      path: '/cart',
      builder: (context, state) => const CartView(),
    ),
  ],
);
