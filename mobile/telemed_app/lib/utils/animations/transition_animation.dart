import 'package:flutter/material.dart';

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const Curve curve = Curves.easeInOut;
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: animation, curve: curve),
      ),
      child: SlideTransition(
        position: Tween(begin: Offset.zero, end: Offset(-1.0, 0.0)).animate(
          CurvedAnimation(parent: secondaryAnimation, curve: curve),
        ),
        child: child,
      ),
    );
  }
}
