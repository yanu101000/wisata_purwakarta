import 'package:flutter/material.dart';
import 'package:wisata_purwakarta/models/constant.dart';
import 'package:wisata_purwakarta/models/sql_model.dart';
import 'package:wisata_purwakarta/view/round_button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email, password, username;
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
      register();
    }
  }

  void register() async {
    UserResult registerResult;
    await UserResult.sqlUserConnect(
        email: email,
        password: password,
        username: username,
        url: BaseUrl.kRegisterUrl)
        .then((value) => registerResult = value);
    print(registerResult.value);
    if (registerResult.value == 1) {
      Navigator.pop(context);
    } else {
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text(registerResult.pesan),
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kYellow,
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Masukan Username';
                  }
                  return null;
                },
                onSaved: (value) => username = value,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Username'),
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
                textButton: 'Sign Up',
                getPressed: () {
                  check();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
