import 'package:flutter/material.dart';

PageRouteBuilder fadeTransitionBuilder({required Widget child}) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final opacity = animation.drive(Tween<double>(begin: 0, end: 1));

        return FadeTransition(opacity: opacity, child: child);
      });
}

PageRouteBuilder fallingPageRoute({required Widget child}) {
    return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }