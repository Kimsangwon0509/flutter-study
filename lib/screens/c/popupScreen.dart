//프로필 화면
import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '팝업',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Container(
            color: Colors.white,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              children: <Widget>[
                AlertButton(),
              ],
            )),
      ),
    );
  }
}

class AlertButton extends StatelessWidget {
  build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
          child: Text(
            '혈당확인',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700),
          ),
          color: Colors.cyan,
          elevation: 6.0,
          onPressed: () {
            //action
            showAlart(context);
          },
        ));
  }

  void showAlart(BuildContext context) {
    var alertDialog = new AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        content: Container(
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xFFFFFF),
            borderRadius: new BorderRadius.all(
              new Radius.circular(32.0),
            ),
          ),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '목표 혈당 범위',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '| 식전',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                        SizedBox(height: 6),
                        Text('80-140', style: TextStyle(fontSize: 30))
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '| 식후',
                          style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                        SizedBox(height: 6),
                        Text('90-180', style: TextStyle(fontSize: 30))
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                '나의 목표 혈당 범위와 다른가요?',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(height: 10),
              Container(
                width: 300.0,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                  ),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.edit, color: Colors.black),
                      SizedBox(width: 7),
                      Text("목표 혈당 범위 수정"),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 300.0,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                  ),
                  child: Text("확인"),
                  color: Colors.cyan,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
