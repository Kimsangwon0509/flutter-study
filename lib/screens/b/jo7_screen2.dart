import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jo7Screen2 extends StatelessWidget {
  final String title = '서비스이용약관';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                  child: Text(
                    '송아리당뇨 서비스이용약관',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      '2019년 09월 05일 시행안',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                    trailing: IconButton(
                      icon:
                          true == true ? Icon(Icons.keyboard_arrow_down) : null,
                      /* TODO: true 부분 변경 필요*/
                      onPressed: null,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
//                    constraints: BoxConstraints.tightForFinite(height: 100),
                    child: Text('loooooooooooool'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
