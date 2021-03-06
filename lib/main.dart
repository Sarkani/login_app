import 'package:flutter/material.dart';

// import 'package:flutter/rendering.dart';

import 'widgets/login-form.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _emailInput;
  String _passwordInput;
  bool _isSelected = false;
  bool _acceptTerms = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  emailInput(value) {
    setState(() {
      _emailInput = value;
    });
  }

  passwordInput(value) {
    setState(() {
      _passwordInput = value;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset('assets/test-login.jpg', height: 250.0),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 75.0),
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset('assets/mbl-logo.png', width: 185.0),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 5, right: 25.0),
                  child: LoginForm(emailInput, passwordInput),
                ),
                SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: 12.0),
                        GestureDetector(
                          onTap: _radio,
                          child: radioButton(_isSelected),
                        ),
                        SizedBox(width: 8.0),
                        Text("Remember me", style: TextStyle(fontSize: 12.0)),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        print('working');
                      },
                      child: Container(
                        width: 175.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xFF00aeef),
                              Color(0xFF16528F),
                            ]),
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFF6078ea).withOpacity(.3),
                                  offset: Offset(0.0, 8.0),
                                  blurRadius: 8.0)
                            ]),
                        child: Center(
                          child: Text(
                            'SIGNIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                letterSpacing: 1.3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox()
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            'Your entered Email is: ' +
                                (_emailInput != null ? _emailInput : ''),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                            'Your entered Password is: ' +
                                (_passwordInput != null ? _passwordInput : ''),
                            textAlign: TextAlign.left),
                      ],
                    )
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
