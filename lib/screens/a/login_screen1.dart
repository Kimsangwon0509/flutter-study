import 'package:flutter/material.dart';

import 'login_screen2.dart';

class LoginScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff7c94b6),
                  image: DecorationImage(
                    image: ExactAssetImage('images/login_background.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 85.0,
                    ),
                    Icon(
                      Icons.desktop_mac,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '디아콘 당뇨',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 35.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        child: Text('회원가입',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        color: Colors.lightBlueAccent,
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 35.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        child: Text(
                          '로그인',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen2();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 35.0),
                      child: FlatButton(
                        child: Text(
                          '나중에 할래요',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
