import 'package:flutter/material.dart';

class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff47a7f4),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.opacity),
                SizedBox(width: 10.0),
                Text('디아콘당뇨'),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.device_hub),
              tooltip: 'Hi!',
              onPressed: () => {},
            ),
            IconButton(
              icon: new Icon(Icons.mic),
              tooltip: '음성인식',
              onPressed: () => {},
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff47a7f4),
                    Color(0xff19c2e0),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text('2월 19일 수요일',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundedButton(
                        iconData: Icons.opacity,
                        labelText: '혈당 관리',
                        backgroundColor: Color(0xffff5082),
                      ),
                      RoundedButton(
                        iconData: Icons.notifications_none,
                        labelText: '투약 관리',
                        backgroundColor: Color(0xff29b8e7),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundedButton(
                        iconData: Icons.local_dining,
                        labelText: '식사 관리',
                        backgroundColor: Color(0xfff8ae40),
                      ),
                      RoundedButton(
                        iconData: Icons.directions_bike,
                        labelText: '운동 관리',
                        backgroundColor: Color(0xffa280f3),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      '송아리 News',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'images/banner.png',
                        width: double.infinity,
                        height: 130.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 20),
                      child: RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        elevation: 4.0,
                        onPressed: () {},
                        icon: Icon(Icons.add_a_photo),
                        label: Text('디아콘당뇨 함께 만들기'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final IconData iconData;
  final String labelText;
  final Color backgroundColor;

  RoundedButton({this.iconData, this.labelText, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(7.0),
          ),
          color: Colors.white,
          elevation: 6.0,
          onPressed: () {},
          child: SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: backgroundColor,
                  child: Icon(
                    iconData,
                    color: Colors.white,
                    size: 37,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(labelText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
