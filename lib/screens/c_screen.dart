import 'package:flutter/material.dart';

class CScreen extends StatelessWidget {
  static const String id = 'c_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.lightGreen,
        child: Center(
          child: MaterialButton(
            onPressed: () {},
            child: Text('C Screen'),
          ),
        ),
      ),
    );
  }
}
