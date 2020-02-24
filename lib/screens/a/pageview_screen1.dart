import 'package:flutter/material.dart';
import 'package:flutter_study/screens/a/pageview_screen2.dart';

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
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Image.asset(
                'images/a/pageview1.png',
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 55.0,
            child: FlatButton(
              color: Colors.cyan,
              child: Text(
                '사용법 보기',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageviewScreen2();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
