import 'package:flutter/material.dart';
import 'package:flutter_study/screens/a/chart_screen1.dart';
import 'package:flutter_study/screens/a/firebase_auth_screen.dart';
import 'package:flutter_study/screens/a/firebase_message_screen.dart';
import 'package:flutter_study/screens/a/pageview_screen1.dart';
import 'package:flutter_study/screens/a/provider_screen.dart';
import 'package:flutter_study/screens/a/sliver_screen.dart';
import 'package:flutter_study/screens/a/webview_screen.dart';

import 'a/bluetooth_screen.dart';
import 'a/chart_screen2.dart';
import 'a/dash_screen.dart';
import 'a/login_screen1.dart';

class AScreen extends StatelessWidget {
  static const String id = 'a_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이준호 Screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
          child: ListView(
            children: <Widget>[
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WebviewScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    '웹뷰화면',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen1();
                        },
                      ),
                    );
                  },
                  child: Text(
                    '로그인화면1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChartScreen1.withSampleData();
                        },
                      ),
                    );
                  },
                  child: Text(
                    '차트화면1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChartScreen2.withSampleData();
                        },
                      ),
                    );
                  },
                  child: Text(
                    '차트화면2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DashScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    '대시화면',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PageviewScreen1();
                        },
                      ),
                    );
                  },
                  child: Text(
                    '페이지뷰화면',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FirebaseAuthScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Firebase인증',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FirebaseMessageScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Firebase메시징',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SliverScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Sliver화면',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProviderScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Provider화면',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BluetoothScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Bluetooth화면',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
