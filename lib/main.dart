import 'package:flutter/material.dart';
import 'package:flutter_study/screens/a_scree.dart';
import 'package:flutter_study/screens/b_screen.dart';
import 'package:flutter_study/screens/c_screen.dart';
import 'package:flutter_study/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        AScreen.id: (context) => AScreen(),
        BScreen.id: (context) => BScreen(),
        CScreen.id: (context) => CScreen(),
      },
    );
  }
}
