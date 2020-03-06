import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirstRoute();
  }
}

class FirstRoute extends StatefulWidget {
  @override
  State createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  final _formkey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  String text = 'first';
  SharedPreferences _pref;
  String _userid;
  String _userpw;
  bool logined = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSession();
  }

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  _loadSession() async {
    _pref = await SharedPreferences.getInstance();
    setState(() {
      _userid = (_pref.getString('userid' ?? null));
      _userpw = (_pref.getString('userpw' ?? null));
      if (_pref.getBool('checkLog' ?? null))
        logined = true;
      else
        logined = false;
    });
  }

  _updateSession() async {
    _pref = await SharedPreferences.getInstance();
    setState(() {
      _userid = (_pref.getString('userid' ?? null));
      _userpw = (_pref.getString('userpw' ?? null));
      if (_pref.getBool('checkLog' ?? null))
        logined = true;
      else
        logined = false;
    });
  }

  _deleteSession() async {
    _pref = await SharedPreferences.getInstance();
    setState(() {
      _pref.setString('userid', null);
      _pref.setString('userpw', null);
      _pref.setBool('checkLog', false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Prefernce CRUD'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            if (logined == false)
              Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _idController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Id',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return '아이디를 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _pwController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return '비밀번호를 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              print(_idController.text.trim());
                              print(_pwController.text.trim());
                              _pref.setString(
                                  'userid', _idController.text.trim());
                              _pref.setString(
                                  'userpw', _pwController.text.trim());
                              _pref.setBool('checkLog', true);
                              _updateSession();
                            });
                          }
                        },
                        child: Text('로그인 정보 저장'),
                      ),
                    )
                  ],
                ),
              ),
            if (logined != false)
              Column(
                children: <Widget>[
                  Text('로그인 되어있습니다.'),
                  RaisedButton(
                    child: Text('로그아웃'),
                    onPressed: () {
                      setState(() {
                        _deleteSession();
                      });
                    },
                  )
                ],
              ),
            SizedBox(
              height: 30,
            ),
            Text('Id = $_userid'),
            Text('Password = $_userpw'),
          ],
        ),
      ),
    );
  }
}
