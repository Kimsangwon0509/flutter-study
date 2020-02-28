import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hi5Screen extends StatefulWidget {
  @override
  _Hi5ScreenState createState() => _Hi5ScreenState();
}

class _Hi5ScreenState extends State<Hi5Screen> {
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.cyan),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _checkButtonSection(context),
          _timePickerSection(),
        ],
      ),
    );
  }

  Widget _checkButtonSection(context) =>
      Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context, _selectedTime);
              },
              child: Text(
                '확인',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
          ],
        ),
      );

  Widget _timePickerSection() =>
      Container(
        height: 250,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (DateTime time) {
            _selectedTime = time;
          },
          initialDateTime: _selectedTime,
        ),
      );
}

