import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/*
* HTTP 통신 및 json 인코딩, 디코딩 테스트(CRUD)
* 데이터 가고 오는 것 각각 테스트 진행
* */
class HttpScreen extends StatefulWidget {
  final context = 'https://jsonplaceholder.typicode.com/posts';

  @override
  _HttpScreenState createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  final textController = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  var _url;
  var _result;
  var _id;

  void oneOffRequestGET({var data}) async {
    var url = '${widget.context}/$data';
    var response = await http.get(url);
    convertJsonDecodeAndSetState(response, url);
  }

  void oneOffRequestPOST({var data}) async {
    var url = '${widget.context}';
    var jsonData = {
      'title': 'foo',
      'body': 'bar',
      'userId': '1'
    };
    var response = await http.post(url, body: jsonData);
    convertJsonDecodeAndSetState(response, url);
    print(url);
  }

  void oneOffRequestPUT({var data}) async {
    var id = data;
    var jsonData = {
      'id': '1',
      'title': 'foo',
      'body': 'bar',
      'userId': '1'
    };

    var url = '${widget.context}/$id';
    var response = await http.put(url, body: jsonData);
    convertJsonDecodeAndSetState(response, url, id: id);
  }

  void convertJsonDecodeAndSetState(http.Response response, var url, {var id}) {
    dynamic jsonResponse;
    if (response.statusCode == 200) {
      jsonResponse = convert.jsonDecode(response.body);
    } else {
      jsonResponse = 'Request failed with status: ${response.statusCode}';
      print("header: " + response.headers.toString());
      print("body: " + response.body.toString());
    }
    setState(() {
      _id = id;
      _url = url;
      _result = response.body.toString(); // 수정 필요
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
            makeTest(
              title: 'GET',
              httpFunction: () => oneOffRequestGET(data: textController.text),
              controller: textController,
            ),
            makeTest(
              title: 'POST',
              httpFunction: () => oneOffRequestPOST(data: textController.text),
              controller: textController2,
            ),
            makeTest(
              title: 'PUT',
              httpFunction: () => oneOffRequestPUT(data: textController.text),
              controller: textController3,
            ),
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
    @required Function httpFunction,
    @required TextEditingController controller,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title),
          Container(
            width: 150,
            child: TextField(
              decoration: InputDecoration(hintText: 'get, put -> id'),
              controller: controller,
            ),
          ),
          FlatButton(
            onPressed: () {
              httpFunction();
            },
            child: Text(
              '전송',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.cyan[200],
          ),
        ],
      );
}
