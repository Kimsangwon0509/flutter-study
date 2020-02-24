import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Jo7Screen2 extends StatefulWidget {
  @override
  _Jo7Screen2State createState() => _Jo7Screen2State();
}

class _Jo7Screen2State extends State<Jo7Screen2> {
  List<String> _locations = [
    '2019년 09월 05일 시행안',
    '2020년 09월 05일 시행안'
  ]; // Option 2
  String _selectedLocation = '2019년 09월 05일 시행안'; // Option 2

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '서비스이용약관',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _headingText,
              Container(
                color: Colors.white,
                child: DropdownButton(
                  value: _selectedLocation,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 25,
                  iconDisabledColor: Colors.red,
                  elevation: 0,
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue;
                    });
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(location),
//                          Icon(Icons.keyboard_arrow_up, size: 25),
                        ],
                      ),
                      value: location,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Text(_longText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headingText = Padding(
    padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
    child: Text(
      '송아리당뇨 서비스이용약관',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  Widget _dates = Container(
    color: Colors.white,
    child: ListTile(
      title: Text(
        '2019년 09월 05일 시행안',
        style: TextStyle(
          color: Colors.grey[400],
        ),
      ),
      trailing: IconButton(
        icon: true == true ? Icon(Icons.keyboard_arrow_down) : null,
        /* TODO: true 부분 변경 필요*/
        onPressed: null,
      ),
    ),
  );

  String _longText = '''개인정보 처리방침
  
  
<테스트>('test'이하 '테스트')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.

<테스트>('테스트') 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

○ 본 방침은부터 2020년 1월 1일부터 시행됩니다.


1. 개인정보의 처리 목적 <테스트>('test'이하 '테스트')은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.

가. 홈페이지 회원가입 및 관리

회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인 등을 목적으로 개인정보를 처리합니다.




2. 개인정보 파일 현황
('test'이하 '테스트')가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.

1. 개인정보 파일명 :
- 개인정보 항목 :
- 수집방법 :
- 보유근거 :
- 보유기간 :
- 관련법령 :



※ 기타(''이하 '')의 개인정보파일 등록사항 공개는 행정안전부 개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일 목록검색 메뉴를 활용해주시기 바랍니다.''';
}
