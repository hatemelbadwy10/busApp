import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  // Push to a new screen
  Future<T?> push<T>(Widget page) {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Push and replace the current screen
  Future<T?> pushReplacement<T>(Widget page) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Push and remove all previous routes (e.g., after login)
  Future<T?> pushAndRemoveUntil<T>(Widget page, {bool removeAll = true}) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => page),
          (route) => !removeAll,
    );
  }

  // Pop current screen
  void pop<T extends Object?>([T? result]) {
    Navigator.pop(this, result);
  }

  // Pop until a specific route
  void popUntil(RoutePredicate predicate) {
    Navigator.popUntil(this, predicate);
  }

  // Check if can pop
  bool canPop() {
    return Navigator.canPop(this);
  }

  // Push and replace all routes in the stack
  Future<T?> pushReplacementAll<T>(Widget page) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => page),
          (route) => false, // This will remove all the previous routes
    );
  }
}
