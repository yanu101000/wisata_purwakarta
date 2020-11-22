import 'package:flutter/material.dart';
import 'package:wisata_purwakarta/models/constant.dart';
import 'package:wisata_purwakarta/models/sql_model.dart';
import 'package:wisata_purwakarta/services/sharedpreferences.dart';
import 'package:wisata_purwakarta/view/home_screen.dart';
import 'package:wisata_purwakarta/view/round_button.dart';
import 'package:wisata_purwakarta/view/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  static const String id = 'loginscreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
  final _key = GlobalKey<FormState>();
  bool _secureText = true;
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  void showHideText() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  void check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  void login() async {
    UserResult userResult;
    await UserResult.sqlUserConnect(
        email: email, password: password, url: BaseUrl.kLoginUrl)
        .then((value) => userResult = value);
    if (userResult.value == 1) {
      SharedPref.simpanPreferences(userResult.emailAPI, userResult.usernameAPI);
      Navigator.pushNamed(context, HomeScreen.id);
    } else {
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text(userResult.pesan),
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreen,
      key: _scaffoldkey,
      body: Form(
        key: _key,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                height: 200.0,
                width: 200.0,
                child: Image.asset('assets/img/logotravelog.png'),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Masukan Email Anda';
                  }
                  return null;
                },
                onSaved: (value) => email = value,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: _secureText,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Masukan Password Anda';
                  }
                  return null;
                },
                onSaved: (value) => password = value,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: showHideText,
                    icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FullWidthRoundButton(
                textButton: 'Login',
                getPressed: () {
                  check();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onVerticalDragStart: (details) {
            showModalBottomSheet(
                isScrollControlled: true,
                enableDrag: true,
                context: context,
                builder: (context) => SignUpScreen());
          },
          child: Container(
            height: 80.0,
            color: kLightGreen,
            child: Container(
              child: Column(
                children: [Icon(Icons.arrow_upward), Text('Sign Up')],
              ),
              decoration: BoxDecoration(
                  color: kYellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
