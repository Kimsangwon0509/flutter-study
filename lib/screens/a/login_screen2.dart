import 'package:flutter/material.dart';

class LoginScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            '로그인',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30.0),
              Text('휴대폰 번호'),
              TextField(
                decoration: InputDecoration(
                  hintText: '- 없이 입력',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text('비밀번호'),
              TextField(
                decoration: InputDecoration(
                  hintText: '숫자 4자리',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 45.0,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  child: Text('로그인',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.cyan,
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text('회원가입'),
                    onPressed: () {},
                  ),
                  Text('|'),
                  FlatButton(
                    child: Text('비밀번호 찾기'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
