import 'package:flutter/material.dart';

class DScreen extends StatelessWidget {
  static const String id = 'd_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('D Screen'),
        ),
        body: Container(
          color: Colors.lightBlue,
          child: Center(
            child: MaterialButton(
              onPressed: () {},
              child: Text('D Screen'),
            ),
          ),
        ),
      ),
    );
  }
}
