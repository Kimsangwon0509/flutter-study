import 'package:flutter/material.dart';
import 'package:flutter_study/screens/c/flutter_calendar_carousel_screen.dart';
import 'package:flutter_study/screens/c/table_calendear_screen.dart';

class Calender extends StatefulWidget {
  static const String id = 'd_screen';

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime _date = new DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2021),
        locale: const Locale('ko', 'KO'),
        //ShowDatePicker Theme Setting
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Colors.white,
              primaryColorLight: Colors.white10,
              accentColor: Colors.black26,
            ),
            child: child,
          );
        });
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
      print('Date selected: ${_date.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    String value;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '투약 관리',
          style: TextStyle(color: Colors.black),
          //textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.clear),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text('${_date.year.toString()}년'
                      ' ${_date.month.toString()}월 '
                      '${_date.day.toString()}일 '),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                    },
                  )
                ],
              ),
              RaisedButton(
                child: Text('TableCalendar'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TableCalender()));
                },
              ),
              RaisedButton(
                child: Text('CarouselScreen'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CarouselScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
