import 'package:flutter/material.dart';


extension Navigation on BuildContext {
  void pushNamed( {Object? arguments , required String routeName, bool rootNavigator = false}) {
    Navigator.of(this , rootNavigator: rootNavigator ).pushNamed(routeName, arguments: arguments , );
  }
  void pop() {
    Navigator.pop(this);
  }

  void pushReplacementNamed( {Object? arguments , required String routeName, bool rootNavigator = false}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void pushAndRemoveUntil({Object? arguments , required String routeName, bool rootNavigator = false}) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }
}