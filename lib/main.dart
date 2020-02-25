import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/screens/a_scree.dart';
import 'package:flutter_study/screens/b_screen.dart';
import 'package:flutter_study/screens/c_screen.dart';
import 'package:flutter_study/screens/main_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ko', 'KO'),
      ],
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
