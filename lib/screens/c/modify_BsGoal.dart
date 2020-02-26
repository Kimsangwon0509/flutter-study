import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ModifyBS extends StatefulWidget {
  @override
  _ModifyBSState createState() => _ModifyBSState();
}

enum setVal { after, after2, before }

class _ModifyBSState extends State<ModifyBS> {
  bool _lights = false;
  String labelVal;
  RangeValues _afterValues = const RangeValues((120), (180));
  RangeValues _after2Values = const RangeValues((200), (220));
  RangeValues _beforeValues = const RangeValues((90), (180));
  Color defaultColor = Colors.pink;

  String getLabel(setVal val) {
    switch (val) {
      case setVal.after:
        if (_lights)
          labelVal = '식후 1시간';
        else
          labelVal = '식후';
        break;
      case setVal.after2:
        labelVal = '식후 2시간';
        break;
      case setVal.before:
        labelVal = '식전(공복)';
        break;
    }
    return labelVal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '목표 혈당 범위',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              '저장',
              style: TextStyle(
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
          child: Container(
              color: Colors.white,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey.withOpacity(0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('임신성 당뇨'),
                        SizedBox(width: 15),
                        CupertinoSwitch(
                          value: _lights,
                          activeColor: Colors.cyan,
                          onChanged: (bool value) {
                            setState(() {
                              _lights = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        customSlideBar(vava: setVal.after, val: _afterValues),
                        if (_lights)
                          customSlideBar(
                              vava: setVal.after2, val: _after2Values),
                        customSlideBar(
                            vava: setVal.before,
                            val: _beforeValues,
                            col: Colors.cyan),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }

  Widget customSlideBar(
          {@required setVal vava, @required RangeValues val, Color col}) =>
      Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${getLabel(vava)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '${val.start.toInt()}-${val.end.toInt()}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text('mg/dL'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              RangeSlider(
                values: val,
                activeColor: (col != null) ? col : defaultColor,
                min: 80,
                max: 260,
                onChanged: (values) {
                  setState(() {
                    switch (vava) {
                      case setVal.after:
                        _afterValues = values;
                        break;
                      case setVal.after2:
                        _after2Values = values;
                        break;
                      case setVal.before:
                        _beforeValues = values;
                        break;
                    }
                  });
                },
              ),
              SizedBox(height: 20),
            ],
          ));
}
