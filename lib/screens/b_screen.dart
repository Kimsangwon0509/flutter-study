import 'package:flutter/material.dart';
import 'package:flutter_study/screens/b/hi3_screen.dart';
import 'package:flutter_study/screens/b/hm3_screen.dart';
import 'package:flutter_study/screens/b/jo1_screen.dart';
import 'package:flutter_study/screens/b/jo7_screen1.dart';
import 'package:flutter_study/screens/b/speech_screen.dart';

class BScreen extends StatelessWidget {
  static const String id = 'b_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B Screen'),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _pageRouteButton(context, title: '회원가입', widget: Jo1Screen()),
                _pageRouteButton(context, title: '약관동의', widget: Jo7Screen1()),
                _pageRouteButton(context, title: '알람설정', widget: Hi3Screen()),
                _pageRouteButton(context, title: '음성인식', widget: Hm3Screen()),
                _pageRouteButton(context, title: '테스트', widget: MyApp()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pageRouteButton(BuildContext context,
          {@required String title, Widget widget}) =>
      MaterialButton(
          color: Colors.cyan,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget),
            );
          });
}
