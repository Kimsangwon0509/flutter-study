import 'package:flutter/material.dart';
import 'package:flutter_study/screens/b/jo1_screen.dart';
import 'package:flutter_study/screens/b/jo7_screen1.dart';

class BScreen extends StatelessWidget {
  static const String id = 'b_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('B Screen'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    color: Colors.cyan,
                    child: Text(
                      '회원가입',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Jo1Screen()),
                      );
                    }),
                MaterialButton(
                    color: Colors.cyan,
                    child: Text(
                      '약관동의',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Jo7Screen1()),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
