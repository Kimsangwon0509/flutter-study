import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

/// # Url
///   - https://pub.dev/packages/flutter_clean_calendar#-versions-tab-
/// # Properties
///   - isExpanded: 전체 화면으로 꽉 채울건지
///   - isExpandable: 확장 가능하게 할건지(접었다 폈다)
///   - eventColor: 진행중인 이벤트 색상(isDone: false)
///   - eventDoneColor: 완료된 이벤트 색상(isDone: true)
///   - onDateSelected: 선택된 날짜 callback, 2020-03-10 00:00:00.000
///   - onRangeSelected: 선택된 날짜의 기간(month/week)
///   - initialDate: 처음 선택 날짜 지정
///   - selectedColor: 선택된 날짜 색상
///   - showArrows: month/week 화살표 표시
///   - showTodayIcon: Today 아이콘 표시
///
///  ***  ui 디자인을 detail하게 수정하긴 어려워보임
class FlutterCleanCalendarScreen extends StatefulWidget {
  @override
  _FlutterCleanCalendarScreenState createState() =>
      _FlutterCleanCalendarScreenState();
}

class _FlutterCleanCalendarScreenState
    extends State<FlutterCleanCalendarScreen> {
  DateTime _selectedDate;

  void setSelectedDay(DateTime currentSelectedDay) {
    setState(() {
      _selectedDate = currentSelectedDay;
    });
  }

  final Map _events = {
    DateTime(2020, 3, 1).toString(): [
      {'name': 'Event A', 'isDone': false},
    ],
    DateTime(2020, 3, 4): [
      {'name': 'Event A', 'isDone': false},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2020, 3, 5): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2020, 3, 13): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2020, 3, 15): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2020, 3, 26): [
      {'name': 'Event A', 'isDone': false},
    ],
  };

  @override
  Widget build(BuildContext context) {
    // build 할 때 날짜가 바뀔까봐 변수를 여기에 둠
    DateTime now = DateTime.now();
    DateTime initialDate = DateTime(now.year, now.month, 1);
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_clean_calendar'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _flutterCleanCalendar(initialDate),
            _detailSelectedEvent(_selectedDate ?? initialDate),
          ],
        ),
      ),
    );
  }

  Widget _flutterCleanCalendar(initialDate) => Calendar(
        events: _events,
        isExpanded: true,
        isExpandable: true,
        eventColor: Colors.pinkAccent,
        eventDoneColor: Colors.grey,
        onDateSelected: (date) => setSelectedDay(date),
        onRangeSelected: (range) =>
            print('## onRangeSelected: ${range.from}, ${range.to}'),
        initialDate: initialDate,
        selectedColor: Colors.cyan,
        showArrows: true,
        showTodayIcon: true,
//        dayBuilder: (ctx, day) => print('##왜죠'),
      );

  Widget _detailSelectedEvent(DateTime selectedDay) => Expanded(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) => Container(
            child: ListTile(
              title: Text(selectedDay.toString()),
            ),
          ),
        ),
      );
}
