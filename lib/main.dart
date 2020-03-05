import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/screens/a_scree.dart';
import 'package:flutter_study/screens/b_screen.dart';
import 'package:flutter_study/screens/c_screen.dart';
import 'package:flutter_study/screens/main_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_study/session_item.dart';
import 'package:provider/provider.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(
    ChangeNotifierProvider(
      create: (context) => SessionItem(),
      child: MyApp(),
    ),
  );
}

Widget buildError(BuildContext context, FlutterErrorDetails error) {
  return Scaffold(
      body: Center(
    child: Text(
      "Error appeared.",
      style: Theme.of(context).textTheme.title,
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ko', 'KR'),
      ],
      locale: Locale('ko', 'KR'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.id,
      builder: (BuildContext context, Widget widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return buildError(context, errorDetails);
        };

        return widget;
      },
      routes: {
        MainScreen.id: (context) => MainScreen(),
        AScreen.id: (context) => AScreen(),
        BScreen.id: (context) => BScreen(),
        CScreen.id: (context) => CScreen(),
      },
    );
  }
}
