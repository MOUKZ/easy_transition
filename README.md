
# easy_transition
![Pub Version](https://img.shields.io/pub/v/easy_transition?color=blue)
![likes](https://badges.bar/easy_transition/likes)
![popularity](https://badges.bar/easy_transition/popularity)
![GitHub](https://img.shields.io/github/license/MOUKZ/easy_transition)


Flutter package to make it easyer to add animation to page navigation.
It provieds scale and fade transition.

### Created by Omar Mouki

[GitHub](https://github.com/MOUKZ) [LinkedIn](https://www.linkedin.com/in/omar-mouki-15988b130/)

<!-- ## Screenshots

<img src="https://raw.githubusercontent.com/MOUKZ/chat_package/main/screenShots/1.jpeg" height="500em"><img src="https://raw.githubusercontent.com/MOUKZ/chat_package/main/screenShots/2.jpeg" height="500em">
<img src="https://raw.githubusercontent.com/MOUKZ/chat_package/main/screenShots/3.jpeg" height="500em">
<img src="https://raw.githubusercontent.com/MOUKZ/chat_package/main/screenShots/4.jpeg" height="500em"> -->

## Usage
 simply add the [EasyTransition] widget and provied a child, and a distination page.
  The default constructor will create a scale animation, 
 ``` dart
   Center(
              child: EasyTransition(
                child: Icon(Icons.ac_unit),
                pageToPush: SecondPage(),
              ),
            ),
 ```

The package supports multy animation, and push typs.
this will use [PushAndRemoveUntil] push type, with the optional
transitionAlignment , and curve.
 
  ``` dart
  Center(
              child: EasyTransition.scalePushAndRemoveUntil(
                child: Icon(Icons.ac_unit),
                pageToPush: SecondPage(),
                transitionAlignment: Alignment.center,
                curve: Curves.decelerate,
              ),
 ```

this will create a fade transitions.
 ``` dart
 Center(
              child: EasyTransition.fadePushReplacement(
                child: Icon(Icons.ac_unit),
                pageToPush: SecondPage(),
              ),
 ```
## Properties
```dart
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

```

## Demo

<img src="https://raw.githubusercontent.com/MOUKZ/chat_package/demo.gif" width="340" height="640" title="Demo">




## Found this project useful?

If you found this project useful, then please consider giving it a ⭐️ on Github and why dont you share it with your friends.


## Issues and feedback

Feel free to open a Github [issue](https://github.com/MOUKZ/easy_transition/issues) to give a suggestion.
