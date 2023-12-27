import 'package:app_pc_store/constants/routers/app_router.dart';
import 'package:app_pc_store/constants/routers/app_routes_name.dart';
import 'package:app_pc_store/constants/strings/strings_generic.dart';
import 'package:app_pc_store/themes/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStringsGeneric.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutesName.home.routeName,
      theme: AppTheme.darkTheme,
    );
  }
}
