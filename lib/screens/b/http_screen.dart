import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/*
* HTTP 통신 및 json 인코딩, 디코딩 테스트(CRUD)
* 데이터 가고 오는 것 각각 테스트 진행
* */
class HttpScreen extends StatefulWidget {
  final context = 'https://jsonplaceholder.typicode.com/photos';


  @override
  _HttpScreenState createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  final textController = TextEditingController();
  var _url;
  var _result;
  var _id;


  void oneOffRequestGET() async {
    var url = '${widget.context}/1';
    var response = await http.get(url);
    convertJsonDecodeAndSetState(response, url);
  }

  void oneOffRequestPOST() async {
    var url = '${widget.context}/photos';
    var data = {'id': '5'};
    var response = await http.post(url, body: data);
    convertJsonDecodeAndSetState(response, url);
  }

  void oneOffRequestPUT() async {
    var url = '${widget.context}/photos/1';
    var response = await http.put(url);
    convertJsonDecodeAndSetState(response, url);
  }

  convertJsonDecodeAndSetState(http.Response response, var url) {
    dynamic jsonResponse;
    if (response.statusCode == 200) {
      jsonResponse = convert.jsonDecode(response.body);
    } else {
      jsonResponse = 'Request failed with status: ${response.statusCode}';
      print(response.headers.toString());
      print(response.body.toString());
    }
    setState(() {
      _url = url;
      _result = jsonResponse.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('HTTP 통신 테스트 화면'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            makeTest(title: 'one_off:GET #1', httpFunction: oneOffRequestGET),
            makeTest(title: 'one_off:POST #2', httpFunction: oneOffRequestPOST),
            makeTest(title: 'one_off:PUT #3', httpFunction: oneOffRequestPUT),
            SizedBox(height: 100),
            Text('#url'),
            Text(_url ?? ''),
            Text('#result'),
            Text(_result ?? ''),
          ],
        ),
      ),
    );
  }

  Widget makeTest({
    @required String title,
    @required VoidCallback httpFunction,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title),
          Container(
            width: 60,
            child: TextField(
              decoration: InputDecoration(hintText: 'ID'),
              controller: textController,
//                onSubmitted: (String value) {
//                  setState(() {
//                    _id = value;
//                  });
//                  httpFunction();
//                  print(_id);
//                },
            ),
          ),
          FlatButton(
            onPressed: () {print(textController.text);},
            child: Text(
              '전송',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.cyan[200],
          ),
        ],
      );
}
