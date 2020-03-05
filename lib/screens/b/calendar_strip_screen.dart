import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/material.dart';

/// # Url
///   - https://pub.dev/packages/calendar_strip
/// # Properties
///   - onDateSelected: (*required) 날짜 선택시 호출되는 함수
///   - startDate: 기간의 시작 날짜
///   - endDate: 기간의 종료 날짜
///     -> 해당 기간이 아닐 경우 disable
///   - selectedDate: 처음 선택 날짜 지정
///   - iconColor: 왼쪽/오른쪽 화살표 아이콘 색상
///   - containerDecoration: 캘린더 컨테이너의 decoration 변경
///  *** 단점 api를 만들다 말았음,,,,
class CalendarStripScreen extends StatefulWidget {
  final String title = 'calendar_strip';

  @override
  _CalendarStripScreenState createState() => _CalendarStripScreenState();
}

class _CalendarStripScreenState extends State<CalendarStripScreen> {
  /// 오늘 날짜의 앞뒤로 2일 추가
  DateTime startDate = DateTime.now().subtract(Duration(days: 2));
  DateTime endDate = DateTime.now().add(Duration(days: 2));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));

  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: CalendarStrip(
        startDate: startDate,
        endDate: endDate,
        onDateSelected: onSelect,
        dateTileBuilder: dateTileBuilder,
        iconColor: Colors.red,
//        monthNameWidget: _monthNameWidget,
        markedDates: markedDates,
        containerDecoration: BoxDecoration(color: Colors.white30),
      )),
    );
  }

  void onSelect(data) => print("Selected Date -> $data");

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = (date.compareTo(selectedDate) == 0);
    Color fontColor = isDateOutOfRange ? Colors.black45 : Colors.black87;
    TextStyle normalStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w800,
      color: fontColor,
    );
    TextStyle selectedStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    );
    TextStyle dayNameStyle = TextStyle(
      fontSize: 14.5,
      color: fontColor,
    );
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.cyan,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }
}
