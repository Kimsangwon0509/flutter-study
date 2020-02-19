import 'package:flutter/material.dart';
import 'package:flutter_study/screens/a/webview_screen.dart';
import 'package:flutter_study/screens/b/jo1_screen.dart';

class BScreen extends StatelessWidget {
  static const String id = 'b_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('B Screen'),
        ),
        body: Container(
          color: Colors.yellow,
          child: Center(
            child: Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Text('B Screen'),
                ),
                IconButton(
                    icon: Icon(Icons.account_circle),
                    tooltip: '회원가입',
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Jo1Screen()),
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
