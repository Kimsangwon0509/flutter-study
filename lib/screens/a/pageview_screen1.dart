import 'package:flutter/material.dart';

class PageviewScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.close),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Container(
            width: double.infinity,
            height: 60.0,
            child: FlatButton(
              color: Colors.cyan,
              child: Text(
                '사용법 보기',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
