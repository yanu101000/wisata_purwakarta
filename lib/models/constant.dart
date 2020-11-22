import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseUrl {
  static const kLoginUrl = 'https://listwisatapurwakarta.000webhostapp.com/login.php';
  static const kRegisterUrl =
      'https://listwisatapurwakarta.000webhostapp.com/register.php';
}

Color kLightGreen = Color(0xFF70C1B3);
Color kDarkerGreen = Color(0xFF1D3E38);
Color kYellow = Color(0xFFF3FFBD);


const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Color.fromRGBO(255, 255, 255, 0.3),
  focusColor: Color.fromRGBO(211, 211, 211, 1.0),
  hintText: '',
  hintStyle: TextStyle(
    color: Color(0xFF1D3E38),
    fontWeight: FontWeight.w800,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);