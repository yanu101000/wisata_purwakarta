import 'package:flutter/material.dart';
import 'package:wisata_purwakarta/models/constant.dart';
import 'package:wisata_purwakarta/view/aboutus_screen.dart';
import 'package:wisata_purwakarta/view/home_screen.dart';
import 'package:wisata_purwakarta/view/login_screen.dart';
import 'package:wisata_purwakarta/view/splash_screen.dart';
import 'package:wisata_purwakarta/view/splashscreenloading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kLightGreen,
        iconTheme: IconThemeData(color: Colors.greenAccent),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreenLoading.id,
      routes: {
        SplashScreenLoading.id: (context) => SplashScreenLoading(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        AboutUsScreen.id: (context) => AboutUsScreen(),
      },
    );
  }
}
