import 'package:app_coffee_shop/view/coffee/coffee_view.dart';
import 'package:app_coffee_shop/view/favorites/favorites_view.dart';
import 'package:app_coffee_shop/view/home/home_view.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      name: 'Home',
      path: '/',
      builder: (context, state) => const HomeView(),
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
  ],
);
