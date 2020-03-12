import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/**
 * ## 구현 순서
 * 자세한 내용은: https://pub.dev/packages/google_maps_flutter#-readme-tab-
 * 1. pubspec.yaml에 google_maps_flutter pakage 추가
 * 2. Google key 발급
 *  a. Google 개발자 콘솔에서 프로젝트 선택(없으면 생성)
 *  b. SDK 추가 ("Additional APIs" -> "ENABLE")
 *    - Maps SDK for Android
 *    - Maps SDK for iOS
 * 3. project setting
 *  a. api key setting
 *    - android: [android/app/src/main/AndroidManifest.xml]에 api key 등록
 *    - iOS: [ios/Runner/AppDelegate.swift] or [ios/Runner/AppDelegate.m]
 * 4. Info.plist setting
 *  - key: io.flutter.embedded_views_preview, value: true인 속성 추가
 *  - 이유: This entry forces Flutter on iOS into a single threaded mode,
 *    which is required for the platform view embedding to work.
 *  - 인용: https://medium.com/flutter/google-maps-and-flutter-cfb330f9a245
 *
 *  ## issue
 *   - E/flutter (27348): [ERROR:flutter/lib/ui/ui_dart_state.cc(157)] Unhandled Exception:
 *     PlatformException(error, java.lang.IllegalStateException: Trying to create an already created platform view, view id: 0
 *    - https://github.com/flutter/flutter/issues/45695
 * */
class GoogleMapsFlutterScreen extends StatefulWidget {
  /// key is required, otherwise map crashes on hot reload
  GoogleMapsFlutterScreen();

  @override
  _GoogleMapsFlutterScreenState createState() =>
      _GoogleMapsFlutterScreenState();
}

class _GoogleMapsFlutterScreenState extends State<GoogleMapsFlutterScreen> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  final Set<Polygon> _polygons = {};
  final Set<Polyline> _polylines = {};
  final Set<Circle> _circles = {};
  Timer _timer;

  // - LatLng: 위도, 경도가 한쌍인 좌표
  // 한국 광화문
  static LatLng _target = LatLng(37.575929, 126.976849);
  static const LatLng _destination = LatLng(37.578253, 126.981493);
  static const LatLng _polygon_point1 = LatLng(37.579929, 126.980849);
  static const LatLng _polygon_point2 = LatLng(37.579929, 126.982849);
  static const LatLng _polygon_point3 = LatLng(37.575929, 126.982849);
  static const LatLng _polygon_point4 = LatLng(37.575929, 126.980849);
  static const LatLng _polyline_point1 = LatLng(37.575929, 126.976849);
  static const LatLng _polyline_point2 = LatLng(37.575880, 126.979546);
  static const LatLng _polyline_point3 = LatLng(37.577880, 126.979637);
  static const LatLng _polyline_point4 = LatLng(37.577649, 126.980593);
  static const LatLng _polyline_point5 = LatLng(37.578334, 126.980960);

  static const List<LatLng> _polygon_points = [
    _polygon_point1,
    _polygon_point2,
    _polygon_point3,
    _polygon_point4,
  ];
  static const List<LatLng> _polyline_points = [
    _polyline_point1,
    _polyline_point2,
    _polyline_point3,
    _polyline_point4,
    _polyline_point5,
    _destination,
  ];

  static CameraPosition _ambulance = CameraPosition(
    target: _target,
    zoom: 15,
  );

  int _index = 0;
  bool _isForward = true;

  @override
  void initState() {
    initMakers();
    initPolygons();
    initPolylines();
    initCircles();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _target = _polyline_points[_index];
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void initMakers() async {
    BitmapDescriptor _ambulanceIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(10, 10)),
      'images/a/amb.png',
    );
    Marker _amb = Marker(
      markerId: MarkerId('앰뷸런스'),
      position: _target,
      icon: _ambulanceIcon,
      infoWindow: InfoWindow(
        title: 'Title test',
        snippet: 'Snippet test',
      ),
    );
    Marker _des = Marker(
      markerId: MarkerId('도착지'),
      position: _destination,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    );
    setState(() {
      _markers.addAll([_amb, _des]);
    });
  }

  void initPolygons() {
    Polygon _pg = Polygon(
      polygonId: PolygonId('Polygon test'),
      points: _polygon_points,
      fillColor: Colors.deepPurpleAccent.withOpacity(0.2),
      strokeColor: Colors.deepPurpleAccent.withOpacity(0.4),
      strokeWidth: 2,
    );
    _polygons.add(_pg);
  }

  void initPolylines() {
    Polyline _pl = Polyline(
      polylineId: PolylineId('Polyline test'),
      points: _polyline_points,
      color: Colors.blueAccent,
      width: 7,
      jointType: JointType.round,
      patterns: [PatternItem.dash(20.0), PatternItem.gap(10.0)],
    );
    _polylines.add(_pl);
  }

  void initCircles() {
    Circle _cc = Circle(
      circleId: CircleId('Circle test1'),
      center: _target,
      radius: 80.0,
      fillColor: Colors.blue.withOpacity(0.3),
      strokeColor: Colors.blue.withOpacity(0.5),
      strokeWidth: 2,
      zIndex: 1,
    );
    _circles.add(_cc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('google_maps_flutter 0.5.24+1'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _ambulance,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
        polygons: _polygons,
        polylines: _polylines,
        circles: _circles,
        scrollGesturesEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheTarget,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheTarget() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_ambulance));
  }

  void refreshTargetLatLng() {
    Timer _timer = Timer(Duration(seconds: 2), () {
      debugPrint('---> timer!');
    });
  }
}
