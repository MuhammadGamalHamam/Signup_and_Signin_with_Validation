import 'package:flutter/material.dart';
import 'WelcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Beginner Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
} // so we're create a normal startup of a flutter application here
// so in our SignupPage is where we're going to be working
