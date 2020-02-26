import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';

const String kListen = '듣고 있어요.';
const String kRepeat = '다시 말해주세요.';

class Hm3Screen extends StatefulWidget {
  @override
  _Hm3ScreenState createState() => _Hm3ScreenState();
}

class _Hm3ScreenState extends State<Hm3Screen> {
  String _state = kRepeat;
  bool _isListening = false;
  List _bloodSugars = ['아침식전 90', '점심식후 120', '취침전 105'];

/*----------------------- start speech_screen setting ------------------------*/
  bool _hasSpeech = false;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);

    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(onResult: resultListener );
    setState(() {
      //@TODO
    });
  }

  void stopListening() {
    speech.stop( );
    setState(() {
      //@TODO
    });
  }

  void cancelListening() {
    speech.cancel( );
    setState(() {
      //@TODO
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    setState(() {
      lastStatus = "$status";
    });
  }
/*----------------------- end speech_screen setting ------------------------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              _state,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 90),
            /* NOTE: ...연산자를 사용하여 배열에 추가함 */
            ..._createBloodSugarTexts(),
          ],
        ),
      ),
      floatingActionButton: _createMicButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _createMicButton() => Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          onPressed: () {
//            switchListeningState();
          },
          child: Icon(
            _isListening ? Icons.more_horiz : Icons.mic,
            size: 50,
            color: Colors.white,
          ),
          backgroundColor: Colors.pinkAccent,
          elevation: 0,
          highlightElevation: 0,
        ),
      );

  List<Text> _createBloodSugarTexts() {
    return _bloodSugars
        .map((bs) => Text(
              '" $bs "',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 18,
                wordSpacing: 5,
                height: 2,
              ),
            ))
        .toList();
  }
}
