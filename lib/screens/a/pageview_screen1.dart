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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            MaterialButton(
              child: Text('사용법 보기'),
            )
          ],
        ),
      ),
    );
  }
}
