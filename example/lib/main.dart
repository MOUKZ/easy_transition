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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: EasyTransition.fade(
                child: Text('normal'),
                pageToPush: SecondPage(),
              ),
            ),
            Center(
              child: EasyTransition(
                child: Icon(Icons.ac_unit),
                pageToPush: SecondPage(),
                transitionAlignment: Alignment.center,
                curve: Curves.decelerate,
              ),
            ),
            Center(
              child: EasyTransition.fadePushReplacement(
                child: Icon(Icons.ac_unit),
                pageToPush: SecondPage(),
              ),
            ),
            // Center(
            //   child: EasyTransition.custom(
            //     child: Text('custom'),
            //     pageToPush: SecondPage(),
            //     customTransition: EasyScaleTransition(SecondPage()),
            //   ),
            // ),
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
        title: Text('Fade Transition'),
      ),
    );
  }
}
