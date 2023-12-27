import 'package:app_pc_store/constants/routers/app_routes_name.dart';
import 'package:app_pc_store/home/chipset_view.dart';
import 'package:app_pc_store/home/home_view.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

mixin AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routeName = settings.name?.replaceAll('/', '').trim() ?? '';
    var route = AppRoutesName.home;

    if (routeName.isNotEmpty) {
      route = EnumToString.fromString(AppRoutesName.values, routeName) ?? route;
    }

    //final args = settings.arguments;

    switch (route) {
      case AppRoutesName.home:
        return MaterialPageRoute(
          fullscreenDialog: true,
          maintainState: false,
          settings: RouteSettings(name: route.routeName),
          builder: (_) => const HomeView(),
        );
      case AppRoutesName.chipset:
        return MaterialPageRoute(
          fullscreenDialog: true,
          maintainState: false,
          settings: RouteSettings(name: route.routeName),
          builder: (_) => const ChipsetView(),
        );
    }
  }
}
