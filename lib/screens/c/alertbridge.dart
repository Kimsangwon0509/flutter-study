import 'package:flutter/material.dart';
import 'package:flutter_study/screens/c/alertForm.dart';

class ABridge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'dart 팝업 테스트',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 0.0),
        child: popButton(),
      )),
    );
  }
}

class popButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
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
              PopFormState().showDialogBox(context);
            },
          ),
        ),
      ],
    );
  }
}
