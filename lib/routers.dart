import 'package:flutter/material.dart';

class EasyFadeTransition extends PageRouteBuilder {
  final Widget page;

  EasyFadeTransition(this.page)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: page,
          ),
        );
}

class EasyScaleTransition extends PageRouteBuilder {
  final Widget page;
  final int? reverseTransitionDurationMilliseconds;
  final int? transitionDurationMilliseconds;
  final Alignment? transitionAlignment;
  final Curve? curve;
  final Curve? reverseCurve;

  EasyScaleTransition(
    this.page, {
    this.reverseTransitionDurationMilliseconds,
    this.transitionDurationMilliseconds,
    this.transitionAlignment,
    this.curve,
    this.reverseCurve,
  }) : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration:
              Duration(milliseconds: transitionDurationMilliseconds ?? 500),
          reverseTransitionDuration: Duration(
              milliseconds: reverseTransitionDurationMilliseconds ?? 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: curve ?? Curves.easeIn,
                parent: animation,
                reverseCurve: reverseCurve ?? Curves.easeOut);
            return ScaleTransition(
              key: UniqueKey(),
              alignment: transitionAlignment ?? Alignment.center,
              scale: animation,
              child: child,
            );
          },
        );
}
