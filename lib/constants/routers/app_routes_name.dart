import 'dart:async';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

enum AppRoutesName {
  home,
}

extension AppRoutesExt on AppRoutesName {
  String get routeName {
    final name = EnumToString.convertToString(this);
    return '/$name';
  }

  void pushNamedVoid(BuildContext context, {Object? arguments}) {
    unawaited(pushNamed(context, arguments: arguments));
  }

  Future<void> pushNamed(BuildContext context, {Object? arguments}) {
    return Navigator.of(context).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void replaceStack(BuildContext context) {
    while (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    unawaited(
      Navigator.of(context).pushReplacementNamed(routeName),
    );
  }

  void popUntil(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.settings.name == routeName);
  }

  String get screenName {
    switch (this) {
      case AppRoutesName.home:
        return 'Inicial';
    }
  }
}
