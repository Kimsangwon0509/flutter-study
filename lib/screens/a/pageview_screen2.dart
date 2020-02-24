import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class PageviewScreen2 extends StatefulWidget {
  @override
  _PageviewScreen2State createState() => _PageviewScreen2State();
}

class _PageviewScreen2State extends State<PageviewScreen2> {
  PageController controller;
  PageView pageView;
  List<Widget> pageList = <Widget>[
    Image.asset('images/a/pageview2.png'),
    Image.asset('images/a/pageview3.png'),
    Image.asset('images/a/pageview4.png'),
    Image.asset('images/a/pageview5.png'),
    Image.asset('images/a/pageview6.png'),
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 1,
    );
    pageView = PageView(
      controller: controller,
      children: pageList,
      scrollDirection: Axis.horizontal,
    );
  }

  @override
  void dispose() {
    if (controller != null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageIndicatorContainer(
              child: pageView,
              align: IndicatorAlign.bottom,
              length: pageList.length,
              indicatorColor: Colors.grey[400],
              indicatorSelectorColor: Colors.cyan,
              shape: IndicatorShape.circle(size: 6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                '다시 안볼래요',
                style: TextStyle(
                  color: Colors.grey[500],
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 55.0,
            child: FlatButton(
              color: Colors.cyan,
              child: Text(
                '시작하기',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
