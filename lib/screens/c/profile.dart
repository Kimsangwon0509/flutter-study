//프로필 화면
import 'package:flutter/material.dart';
import 'package:flutter_study/screens/a/login_screen2.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            ' ',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.notifications, color: Colors.black),
              tooltip: 'Hi!',
              onPressed: () => {},
            ),
            new IconButton(
              icon: new Icon(
                Icons.settings,
                color: Colors.black,
              ),
              tooltip: 'Wow',
              onPressed: () => {},
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 15),
                  child: Text(
                    '로그인해주세요',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 15),
                  child: Text(
                    '회원가입하시고 다양한 서비스를 경험해보세요!',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black.withOpacity(0.3)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0),
              ),
              FlatButton(
                child: Text(
                  '로그인/회원가입',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                color: Colors.cyan,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen2()),
                  );
                },
              ),
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 20.0),
                children: <Widget>[
                  Divider(),
                  Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      Padding(padding: const EdgeInsets.only(left: 15.0)),
                      Icon(Icons.phonelink_setup, color: Colors.cyan),
                      Padding(padding: const EdgeInsets.only(left: 10.0)),
                      Text(' 홈 메뉴 관리')
                    ]),
                  ),
                  Divider(),
                  Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      Padding(padding: const EdgeInsets.only(left: 15.0)),
                      Icon(Icons.desktop_mac, color: Colors.cyan),
                      Padding(padding: const EdgeInsets.only(left: 10.0)),
                      Padding(
                        padding: EdgeInsets.only(left: 3.0),
                      ),
                      Text(' 디아콘 당뇨 Web')
                    ]),
                  ),
                  Divider(),
                  Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      Padding(padding: const EdgeInsets.only(left: 15.0)),
                      Icon(Icons.person_outline, color: Colors.cyan),
                      Padding(padding: const EdgeInsets.only(left: 10.0)),
                      Text(' 의사에게 보여주기')
                    ]),
                  ),
                  Divider(),
                  Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      Padding(padding: const EdgeInsets.only(left: 15.0)),
                      Icon(Icons.event_note, color: Colors.cyan),
                      Padding(padding: const EdgeInsets.only(left: 10.0)),
                      Text(' 진료 및 약제 처방전')
                    ]),
                  ),
                  Divider(),
                  Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      Padding(padding: const EdgeInsets.only(left: 15.0)),
                      Icon(Icons.thumb_up, color: Colors.cyan),
                      Padding(padding: const EdgeInsets.only(left: 10.0)),
                      Text(' 마음 건강 케어')
                    ]),
                  ),
                  Divider(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
