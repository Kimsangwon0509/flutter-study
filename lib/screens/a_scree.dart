import 'package:flutter/material.dart';
import 'package:flutter_study/screens/a/webview_screen.dart';

import 'a/login_screen1.dart';

class AScreen extends StatelessWidget {
  static const String id = 'a_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('A Screen'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}