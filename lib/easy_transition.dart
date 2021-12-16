library easy_transition;

import 'package:flutter/material.dart';
import 'routers.dart';

/// enum to choose the navigation type
enum NavigationType { Push, PushAndRemoveUntil, PushReplacement }

class EasyTransition extends StatefulWidget {
  /// required params for all constructors

  /// [child] is the clickable widget to
  /// activate the navigation
  final Widget child;

  /// [pageToPush] is the destination page to navigate to
  final Widget pageToPush;

  /// optional params for all scale constructors and the default constructor

  /// [transitionDurationMilliseconds] the time for the
  /// push animation default [ transitionDurationMilliseconds = 500 ]
  int? transitionDurationMilliseconds;

  /// [reverseTransitionDurationMilliseconds] the time for the
  /// pop animation default [ reverseTransitionDurationMilliseconds = 200 ]
  int? reverseTransitionDurationMilliseconds;

  /// the starting point for the scale animation
  Alignment? transitionAlignment;

  /// the push animation type of the scale navigation
  Curve? curve;

  /// the pop animation type of the scale navigation
  Curve? reverseCurve;

  // req for custom
  // PageRouteBuilder? customTransition;

  int _type = 0;

  bool? newRoute;

  late NavigationType _navigationType;

  /// the default constructor
  /// will push a scale transition
  EasyTransition({
    required this.child,
    required this.pageToPush,
    this.curve,
    this.reverseCurve,
    this.reverseTransitionDurationMilliseconds,
    this.transitionDurationMilliseconds,
    this.transitionAlignment,
  }) {
    _type = 0;
    _navigationType = NavigationType.Push;
  }

  /// the default constructor
  /// will PushReplacement a scale transition
  EasyTransition.scalePushReplacement({
    required this.child,
    required this.pageToPush,
    this.curve,
    this.reverseCurve,
    this.reverseTransitionDurationMilliseconds,
    this.transitionDurationMilliseconds,
    this.transitionAlignment,
  }) {
    _type = 0;

    _navigationType = NavigationType.PushReplacement;
  }

  /// the default constructor
  /// will PushAndRemoveUntil a scale transition
  EasyTransition.scalePushAndRemoveUntil({
    required this.child,
    required this.pageToPush,
    this.curve,
    this.reverseCurve,
    this.reverseTransitionDurationMilliseconds,
    this.transitionDurationMilliseconds,
    this.transitionAlignment,
    this.newRoute = false,
  }) {
    _type = 0;

    _navigationType = NavigationType.PushAndRemoveUntil;
  }

  /// the default constructor
  /// will push a fade transition
  EasyTransition.fade({required this.child, required this.pageToPush}) {
    _type = 1;
    _navigationType = NavigationType.Push;
  }

  /// the default constructor
  /// will PushReplacement a fade transition
  EasyTransition.fadePushReplacement(
      {required this.child, required this.pageToPush, this.newRoute = false}) {
    _type = 1;

    _navigationType = NavigationType.PushReplacement;
  }

  /// the default constructor
  /// will PushAndRemoveUntil a fade transition
  EasyTransition.fadePushAndRemoveUntil(
      {required this.child, required this.pageToPush, this.newRoute = false}) {
    _type = 1;

    _navigationType = NavigationType.PushAndRemoveUntil;
  }

  /// for future custom support
  // EasyTransition.custom(
  //     {required this.customTransition,
  //     required this.child,
  //     required this.pageToPush}) {
  //   _navigationType = NavigationType.Push;
  //   _type = 2;
  // }

  @override
  _EasyTransitionState createState() => _EasyTransitionState();
}

class _EasyTransitionState extends State<EasyTransition> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: widget.child,
      onTap: () async {
        /// verify the transition type with it is fade or scale
        switch (widget._type) {

          /// 0 is the default scale transition
          case 0:
            nav(
                context,
                widget._navigationType,
                EasyScaleTransition(widget.pageToPush,
                    curve: widget.curve,
                    reverseCurve: widget.reverseCurve,
                    reverseTransitionDurationMilliseconds:
                        widget.reverseTransitionDurationMilliseconds,
                    transitionDurationMilliseconds:
                        widget.transitionDurationMilliseconds,
                    transitionAlignment: widget.transitionAlignment));

            break;

          /// 1 for the fade transition
          case 1:
            nav(context, widget._navigationType,
                EasyFadeTransition(widget.pageToPush));

            break;

          // case 2:
          //   nav(context, widget._navigationType, widget.customTransition!);
          //   break;
          default:
        }
      },
    );
  }

  /// [nav] method will check for the push type
  void nav(BuildContext context, NavigationType navigationType,
      PageRouteBuilder pageBuilder) {
    switch (navigationType) {
      case NavigationType.Push:
        Navigator.push(
          context,
          pageBuilder,
        );

        break;
      case NavigationType.PushAndRemoveUntil:
        Navigator.pushAndRemoveUntil(
            context, pageBuilder, (route) => widget.newRoute!);

        break;
      case NavigationType.PushReplacement:
        Navigator.pushReplacement(context, pageBuilder);

        break;
      default:
    }
  }
}
