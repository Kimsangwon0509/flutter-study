import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Jo1Screen extends StatelessWidget {
  static const String id = "jo1_screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('jo1 Screen'),
        ),
        body: Column(
          children: [
            titleSection,
            inputNumberSection,
            nextButtonSection,
          ],
        ),
      ),
    );
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.only(top: 50, bottom: 30),
    child: Text(
      '휴대폰 번호를 입력해 주세요',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget inputNumberSection = Container(
    padding: const EdgeInsets.only(left: 80, right: 80),
    child: TextFormField(
      /************ 기본 *************/
      /* 스타일 */
      style: TextStyle(
        color: Colors.black87,
        fontSize: 25,
      ),
      /* 커서 색상 */
      cursorColor: Colors.cyanAccent[100],
      cursorWidth: 2,
      /************ 입력시 *************/
      /* 스타일 */
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyanAccent[100],
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyanAccent[100],
            width: 2,
          ),
        ),
        hintText: '-없이 입력',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 25,
        ),
        helperText: '휴대폰 번호는 아이디로 사용됩니다',
        helperStyle: TextStyle(
          fontSize: 15,
          height: 3,
        ),
//        errorText: '번호를 정정확하게 입력해주세요',
//        errorStyle: TextStyle(),
      ),
      /* 숫자만 가능하게 */
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
    ),
  );

  Widget nextButtonSection = Container(
    child: MaterialButton(
      disabledColor: Colors.cyanAccent[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      padding: const EdgeInsets.only(left: 150, right: 150, top: 10, bottom: 10),
      child: Text(
        '다 음',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    ),
  );
}
