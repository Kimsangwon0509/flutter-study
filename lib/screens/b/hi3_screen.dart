import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Hi3Screen extends StatefulWidget {
  @override
  _Hi3ScreenState createState() => _Hi3ScreenState();
}

class _Hi3ScreenState extends State<Hi3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('알람 설정'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              '수정',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
      /* 여러개 추가되면 스크롤 가능해야되기떄문에 Column이 아닌 ListView 사용 */
      body: ListView(

        children: ListTile.divideTiles(
          context: context,
          tiles: [
            AlarmTile(Icons.brightness_4, title: '기상직후', time: '07:00'),
            AlarmTile(Icons.brightness_7, title: '아침', time: '08:00'),
            AlarmTile(Icons.brightness_5, title: '점심', time: '12:00'),
            AlarmTile(Icons.brightness_1, title: '저녁', time: '18:00'),
            AlarmTile(Icons.brightness_3, title: '취침전', time: '22:00'),
          ],
        ).toList(),
      ),
    );
  }
}

class AlarmTile extends StatefulWidget {
  final String title;
  final String time;
  final IconData icon;
  String ampm;

  /* NOTE: 콜론 사용자 사용
  * this.icon 처럼 사용하려면 맨 앞에만 들어와지는듯
  * */
  AlarmTile(this.icon, {@required this.title, @required this.time})
      : ampm = int.parse(time.split(':')[0]) < 12 ? 'AM' : 'PM';

  @override
  _AlarmTileState createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  bool _light = false;
  Color _backgroundColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconWithText(title: widget.title, icon: widget.icon),
      title: Row(
        /* Note: baseline 사용 방법 */
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          Text(
            widget.time,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(widget.ampm),
        ],
      ),
      trailing: CupertinoSwitch(
        activeColor: Colors.cyan,
        value: _light,
        onChanged: (bool value) {
          setState(() {
            _light = value;
          });
        },
      ),
    );
  }
}

Widget iconWithText({@required String title, @required IconData icon}) =>
    IntrinsicHeight(
      child: SizedBox(
        width: 50,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Icon(
                icon,
                size: 40,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w100,
              ),
            )
          ],
        ),
      ),
    );
