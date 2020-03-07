import 'package:flutter/material.dart';
import 'package:flutter_study/screens/b/apple_login.dart';
import 'package:flutter_study/screens/b/calendar_strip_screen.dart';
import 'package:flutter_study/screens/b/flutter_clean_calendar_screen.dart';
import 'package:flutter_study/screens/b/hi3_screen.dart';
import 'package:flutter_study/screens/b/hm3_screen.dart';
import 'package:flutter_study/screens/b/http_screen.dart';
import 'package:flutter_study/screens/b/jo1_screen.dart';
import 'package:flutter_study/screens/b/jo7_screen1.dart';
import 'package:flutter_study/screens/b/speech_screen.dart';
import 'package:flutter_study/screens/b/sqflite_screen.dart';

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
                Divider(),
                _pageRouteButton(context,
                    title: 'STT API test', widget: MyApp()),
                _pageRouteButton(context,
                    title: 'HTTP test', widget: HttpScreen()),
                Divider(),
                _pageRouteButton(context,
                    title: 'apple login', widget: AppleLogin()),
                Divider(),
                _pageRouteButton(context,
                    title: 'flutter_clean_calendar',
                    widget: FlutterCleanCalendarScreen()),
                _pageRouteButton(context,
                    title: 'calendar_strip', widget: CalendarStripScreen()),
                _pageRouteButton(context,
                    title: 'sqlflite', widget: SqfliteScreen()),
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
          minWidth: 220,
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
