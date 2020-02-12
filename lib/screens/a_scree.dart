import 'package:flutter/material.dart';

class AScreen extends StatelessWidget {
  static const String id = 'a_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {},
            child: Text('A Screen'),
          ),
        ),
      ),
    );
  }
}
