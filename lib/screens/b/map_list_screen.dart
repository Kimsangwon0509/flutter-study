import 'package:flutter/material.dart';
import 'package:flutter_study/screens/b/google_maps_flutter.dart';
import 'package:flutter_study/screens/b_screen.dart';

class MapListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지도 패키지 테스트 목록'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            routeButtonOnPageB(
              context,
              title: 'google_maps_flutter0.5.24+1',
              widget: GoogleMapsFlutterScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
