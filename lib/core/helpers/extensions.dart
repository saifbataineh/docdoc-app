import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushReplacementName(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predeicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predeicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
