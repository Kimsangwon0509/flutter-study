import 'package:flutter/material.dart';
import 'package:flutter_study/screens/c/find_pw.dart';
import 'package:flutter_study/screens/c/profile.dart';
import 'package:flutter_study/screens/c/popupScreen.dart';

class CScreen extends StatelessWidget {
  static const String id = 'c_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C Screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 200.0,
                  child: MaterialButton(
                    color: Colors.cyan,
                    child: Text('비밀번호 찾기'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FindPw()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 200.0,
                  child: MaterialButton(
                    color: Colors.cyan,
                    child: Text('프로필 화면'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 200.0,
                  child: MaterialButton(
                    color: Colors.cyan,
                    child: Text('팝업 화면'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PopUp()),
                      );
                    },
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
