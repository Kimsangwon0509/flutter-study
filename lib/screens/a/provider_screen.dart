import 'package:flutter/material.dart';
import 'package:flutter_study/screens/b/apple_login.dart';
import 'package:provider/provider.dart';

import '../../session_item.dart';

class ProviderScreen extends StatefulWidget {
  @override
  _ProviderScreenState createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  @override
  Widget build(BuildContext context) {
    final SessionItem sessionItem = Provider.of<SessionItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: <Widget>[
              Text('UserId: ${sessionItem.userId}'),
              Text('UserName: ${sessionItem.userName}'),
              Text('PumpId: ${sessionItem.pumpId}'),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Input User ID',
                  labelText: 'UserID',
                ),
                onChanged: (value) {
                  sessionItem.userId = value;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Input User Name',
                  labelText: 'UserName',
                ),
                onChanged: (value) {
                  sessionItem.userName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Input Pump ID',
                  labelText: 'PumpID',
                ),
                onChanged: (value) {
                  sessionItem.pumpId = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
