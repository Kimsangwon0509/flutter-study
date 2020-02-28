//비밀번호 찾기 페이지
import 'package:flutter/material.dart';

class FindPw extends StatelessWidget {
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
            '비밀번호 찾기',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '본인인증을 위해 가입시 입력한 휴대폰 번호와 생년월일, 성별을 입력해주세요',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                SizedBox(height: 20.0),
//              Text(
//                '휴대폰 번호',
//              ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(hintText: '- 없이 입력', labelText: "휴대폰번호"),
                ),
                SizedBox(
                  height: 15.0,
                ),
//              Text('생년월일'),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '1950.01.01', labelText: "생년월일"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('성별'),
                Row(
                  children: <Widget>[
//                    Radio(
//                      value: 1,
//                      activeColor: Colors.lightBlue,
//                    ),
//                    Text('여'),
//                    Radio(
//                      value: 2,
//                      activeColor: Colors.lightBlue,
//                    ),
//                    Text('남'),
                  ],
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
                    child: Text('요 청',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    color: Colors.cyan,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
