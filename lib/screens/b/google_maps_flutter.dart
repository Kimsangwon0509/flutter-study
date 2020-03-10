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
  final Set<Polygon> _polygon = {};

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: MarkerId('Marker test'),
        position: _target,
        infoWindow: InfoWindow(
          title: 'Test Title',
          snippet: 'Test Snippet',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
    );
    _polygon.add(
      Polygon(
        polygonId: PolygonId('Polygon test'),
        points: [_target2, _target3, _target4, _target5],
        fillColor: Colors.red.withOpacity(0.5),
        strokeColor: Colors.red,
        strokeWidth: 3,
      ),
    );
  }

  // - LatLng: 위도, 경도가 한쌍인 좌표
  static const LatLng _target = LatLng(37.42796133580664, -122.085749655962);
  static const LatLng _target2 = LatLng(37.42396265331129, -122.082249655962);
  static const LatLng _target3 = LatLng(37.42396265331129, -122.091749655962);
  static const LatLng _target4 = LatLng(37.43096265331129, -122.091749655962);
  static const LatLng _target5 = LatLng(37.43096265331129, -122.082249655962);
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: _target,
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('google_maps_flutter 0.5.24+1'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
        polygons: _polygon,
        compassEnabled: true,
        mapToolbarEnabled: true,
        scrollGesturesEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
