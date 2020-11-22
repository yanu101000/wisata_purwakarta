import 'package:flutter/material.dart';
import 'package:wisata_purwakarta/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_purwakarta/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _getPref();
  }

  _getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String _emailAPI = pref.getString('email');
    if (_emailAPI != '' && _emailAPI != null) {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}