import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.amber,);
  }
}
