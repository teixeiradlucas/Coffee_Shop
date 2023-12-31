import 'package:app_coffee_shop/home/favorites_view.dart';
import 'package:app_coffee_shop/home/home_view.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesView(),
    ),
  ],
);