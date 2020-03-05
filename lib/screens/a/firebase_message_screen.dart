import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class FirebaseMessageScreen extends StatefulWidget {
  @override
  _FirebaseMessageScreenState createState() => _FirebaseMessageScreenState();
}

class _FirebaseMessageScreenState extends State<FirebaseMessageScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final String _serverToken =
      'AAAAWXYNim0:APA91bGJHbOqYbsCNipQZRILggAX4HWieA8fRlwFCZ6keVT1PXJZvJ9qh0RgM5SJZMEN8a-2nlPa3BaJSBddR3wn59DR5uDF1NiXM_8aViqB8gSIQqrb7vrC9YlT4QD2rQj8uDzb1qja';
  TextEditingController _textEditingControllerTitle = TextEditingController();
  TextEditingController _textEditingControllerBody = TextEditingController();
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  @override
  void dispose() {
    _textEditingControllerTitle.dispose();
    _textEditingControllerBody.dispose();
    super.dispose();
  }

  void sendMessage() async {
    print("sendMessage()");

    await _firebaseMessaging.requestNotificationPermissions(
      IosNotificationSettings(
        sound: true,
        badge: true,
        alert: true,
        provisional: false,
      ),
    );

    print('Token: ${await _firebaseMessaging.getToken()}');
    await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$_serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': _textEditingControllerBody.text,
            'title': _textEditingControllerTitle.text
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': await _firebaseMessaging.getToken(),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Message'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _textEditingControllerTitle,
                  decoration: InputDecoration(
                    labelText: '메시지 제목',
                    hintText: '메시지 제목을 입력하세요.',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '메시지 제목은 필수 입력 값 입니다.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _textEditingControllerBody,
                  decoration: InputDecoration(
                    labelText: '메시지 본문',
                    hintText: '메시지 본문을 입력하세요.',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '메시지 본문은 필수 입력 값 입니다.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    sendMessage();
                  },
                  child: Text('푸시메시지발송'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
