import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wisata_purwakarta/models/constant.dart';
import 'package:wisata_purwakarta/view/login_screen.dart';

class SplashScreenLoading extends StatefulWidget {
  static const String id = 'splashscreenloading';
  @override
  _SplashScreenLoadingState createState() => _SplashScreenLoadingState();
}

class _SplashScreenLoadingState extends State<SplashScreenLoading> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, ()
    {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              height: 250.0,
              width: 250.0,
              child: Image.asset('assets/img/logotravelog.png'),
            ),
          ],
        ),
      ),
    );
  }
}
