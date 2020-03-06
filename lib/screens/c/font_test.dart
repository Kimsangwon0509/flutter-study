import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FontTest();
  }
}

class FontTest extends StatefulWidget {
  @override
  _FontTestState createState() => _FontTestState();
}

class _FontTestState extends State<FontTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Test'),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Flutter Font',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 50.0,
                  ),
                ),
                Text(
                  'Google Fonts PlugIN',
                  style: GoogleFonts.raleway(
                      fontStyle: FontStyle.italic, fontSize: 30),
                ),
                Text(
                  'My New Custom Font',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 40.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
