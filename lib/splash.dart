import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/splash.png'),
      ),
    );
  }
}