import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_study/screens/b/hi5_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Hi3Screen extends StatelessWidget {
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
      body: listViewUseDivideTiles(context),
    );
  }
}

class AlarmTile extends StatefulWidget {
  final String title;
  final String time;
  final IconData icon;
  final Color color;
  final String _ampm;
  final Color _defaultColor = Colors.grey[100];

  /* NOTE: 콜론 사용자 사용
  * this.icon 처럼 사용하려면 맨 앞에만 들어와지는듯
  * */
  AlarmTile(this.icon, this.color, {@required this.title, @required this.time})
      : _ampm = int.parse(time.split(':')[0]) < 12 ? 'AM' : 'PM';

  @override
  _AlarmTileState createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _isSwitchOn ? null : widget._defaultColor,
      child: ListTile(
        leading: iconWithText(title: widget.title, icon: widget.icon),
        title: GestureDetector(
          onTap: () => showModalBottomSheet(
              context: context, builder: (context) => Hi5Screen()),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
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
                Text(widget._ampm),
              ],
            ),
          ),
        ),
        trailing: CupertinoSwitch(
          activeColor: Colors.cyan,
          value: _isSwitchOn,
          onChanged: (bool value) {
            setState(() {
              _isSwitchOn = value;
              alarmToast(light: _isSwitchOn, title: widget.title);
            });
          },
        ),
      ),
    );
  }

  Widget iconWithText({@required String title, @required IconData icon}) =>
      SizedBox(
        /* NOTE: 정렬을 위해 추가 */
        width: 50,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Icon(
                icon,
                size: 35,
                color: _isSwitchOn ? widget.color : Colors.black54,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      );

  void alarmToast({@required bool light, @required String title}) {
    String _onMsg = '알람이 설정되었습니다. $title 직후에 투약정보가 있을때만 알람이 울립니다.';
    String _offMsg = '알람이 해제되었습니다.';
    Fluttertoast.showToast(
        msg: light ? _onMsg : _offMsg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black87.withOpacity(0.8),
        fontSize: 15,
        textColor: Colors.white);
  }
}

Widget listViewUseDivideTiles(var context) => ListView(
        children: ListTile.divideTiles(
      context: context,
      color: Colors.grey[500],
      tiles: [
        AlarmTile(
          Icons.brightness_4,
          Colors.blue,
          title: '기상직후',
          time: '07:00',
        ),
        AlarmTile(
          Icons.brightness_7,
          Colors.red,
          title: '아침',
          time: '08:00',
        ),
        AlarmTile(
          Icons.brightness_5,
          Colors.amber,
          title: '점심',
          time: '12:00',
        ),
        AlarmTile(
          Icons.brightness_1,
          Colors.indigo[500],
          title: '저녁',
          time: '18:00',
        ),
        AlarmTile(
          Icons.brightness_3,
          Colors.deepPurpleAccent,
          title: '취침전',
          time: '20:00',
        ),
        AlarmTile(
          Icons.brightness_3,
          Colors.deepPurpleAccent,
          title: '취침전',
          time: '21:00',
        ),
        AlarmTile(
          Icons.brightness_3,
          Colors.deepPurpleAccent,
          title: '취침전',
          time: '22:00',
        ),
        AlarmTile(
          Icons.brightness_3,
          Colors.deepPurpleAccent,
          title: '취침전',
          time: '23:00',
        ),
        AlarmTile(
          Icons.brightness_3,
          Colors.deepPurpleAccent,
          title: '취침전',
          time: '00:00',
        ),
      ],
    ).toList());
