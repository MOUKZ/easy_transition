import 'package:easy_transition/easy_transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Easy Transition'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EasyTransition(
              child: Card(
                  child: Container(
                height: 150,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('default scale animation'),
                      Icon(Icons.person)
                    ],
                  ),
                ),
              )),
              pageToPush: SecondPage(),
              transitionDurationMilliseconds: 400,
              transitionAlignment: Alignment.center,
              curve: Curves.decelerate,
            ),
            EasyTransition.fadePushReplacement(
              child: Card(
                child: Container(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('fadePushReplacement fade animation'),
                      Icon(Icons.phone_android)
                    ],
                  ),
                ),
              ),
              pageToPush: SecondPage(),
            ),
            EasyTransition(
              child: Card(
                child: Container(
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('default scale animation'),
                        Icon(Icons.access_alarms)
                      ],
                    ),
                  ),
                ),
              ),
              pageToPush: SecondPage(),
              transitionDurationMilliseconds: 400,
              transitionAlignment: Alignment.topLeft,
              curve: Curves.easeIn,
              reverseCurve: Curves.bounceInOut,
            ),
          ],
        ));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text('Second Page'),
      ),
    );
  }
}
