import 'package:app_coffee_shop/constants/routers/routes.dart';
import 'package:app_coffee_shop/constants/strings/strings_generic.dart';
import 'package:app_coffee_shop/constants/themes/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStringsGeneric.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
