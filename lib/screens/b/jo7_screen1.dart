import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/screens/b/jo7_screen2.dart';

class Jo7Screen1 extends StatefulWidget {
  @override
  _Jo7ScreenState createState() => _Jo7ScreenState();
}

class _Jo7ScreenState extends State<Jo7Screen1> {
  final String title = '약관동의';

  Icon leadingIcon = Icon(Icons.check_circle, color: Colors.grey[400]);
  Icon trailingIcon = Icon(Icons.keyboard_arrow_right, color: Colors.grey[400]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            _acceptedAll(),
            _divider,
            _leadingAndTrailingTile('서비스 이용 약관 동의(필수)'),
            _leadingAndTrailingTile('개인정보 수집이용 및 취급위탁 동의(필수)'),
            _leadingAndTrailingTile('개인정보 제 3자 제공 동의(필수)'),
            _leadingTile('마케팅 정보 수신 동의(선택)'),
            _selectMarketing(),
            SizedBox(height: 20),
            _button,
          ],
        ),
      ),
    );
  }

  Widget _acceptedAll() => Row(
    children: <Widget>[
      IconButton(
        /* 전체동의는 default size보다 크게 설정 */
        icon: Icon(
          leadingIcon.icon,
          color: leadingIcon.color,
          size: 25,
        ),
        onPressed: null,
      ),
      Text(
        '모두 동의',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    ],
  );

  ListTile _tile(String title, Icon leadingIcon, Icon trailing) => ListTile(
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: leadingIcon,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 13),
        ),
        trailing: trailing != null
            ? IconButton(
                icon: trailingIcon,
                color: Colors.grey[400],
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Jo7Screen2())),
              )
            : null,
      );

  ListTile _leadingTile(String title) => _tile(title, leadingIcon, null);

  ListTile _leadingAndTrailingTile(String title) =>
      _tile(title, leadingIcon, trailingIcon);

  Widget _selectMarketing() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(icon: leadingIcon, onPressed: null),
          Text('푸시알림'),
          SizedBox(width: 10),
          IconButton(icon: leadingIcon, onPressed: null),
          Text('SMS'),
          SizedBox(width: 10),
          IconButton(icon: leadingIcon, onPressed: null),
          Text('이메일'),
        ],
      );
} // class


Widget _divider = Divider(
  color: Colors.grey[400],
  height: 10,
  indent: 20,
  endIndent: 20,
);

Widget _button = MaterialButton(
  onPressed: null,
  disabledColor: Colors.grey[300],
  padding: EdgeInsetsDirectional.fromSTEB(150, 10, 150, 10),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(22.0),
  ),
  child: Text(
    '등록',
    style: TextStyle(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
  ),
);
