import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';

const String kListen = '듣고 있어요.';
const String kRepeat = '다시 말해주세요.';
const String kNone = '다음과 같이 시간대와 혈당값을 말해주세요.';

class Hm3Screen extends StatefulWidget {
  @override
  _Hm3ScreenState createState() => _Hm3ScreenState();
}

class _Hm3ScreenState extends State<Hm3Screen> {
  String _message = kRepeat;
  bool _isListening = false;
  List _bloodSugars = ['아침식전 90', '점심식후 120', '취침전 105'];

  void toggleListeningEvent() {
    _isListening ? stopListening() : startListening();
  }

/*----------------------- start speech_screen setting ------------------------*/
  bool _hasSpeech = false;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    initSpeechState();
    initListening();
    _message = searchMessage();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
    initListening();
  }

  void initListening() {
    _hasSpeech ? startListening() : () {};
  }

  void startListening() {
    lastWords = '';
    lastError = '';
    speech.listen(onResult: resultListener, listenFor: Duration(seconds: 5), localeId: 'ko');
    setState(() {
      _isListening = true;
      _message = searchMessage();
    });
  }

  void stopListening() {
    speech.stop();
    setState(() {
      _isListening = false;
      _message = searchMessage();
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      _isListening = false;
      _hasSpeech = false;
      _message = searchMessage();
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    if (result.finalResult) {
      setState(() {
        lastWords = '${result.recognizedWords}';
        _bloodSugars.add(lastWords);
      });
    }
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    setState(() {
      lastStatus = '$status';
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
              cancelListening();
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
            _createMessage(),
            SizedBox(height: 70),
            ..._createBloodSugarTexts(), /* NOTE: ...연산자를 사용하여 배열에 추가함 */
          ],
        ),
      ),
      floatingActionButton: _createMicButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _createMessage() =>
      Text(
        _message,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _createMicButton() =>
      Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          onPressed: () {
            toggleListeningEvent();
          },
          child: _hasSpeech
              ? Icon(
            _isListening ? Icons.more_horiz : Icons.mic,
            size: 50,
            color: Colors.white,
          )
              : null,
          backgroundColor: Colors.pinkAccent,
          elevation: 0,
          highlightElevation: 0,
        ),
      );

  String searchMessage() {
    if (_hasSpeech && _isListening) {
      return kListen;
    } else if (_hasSpeech) {
      return kRepeat;
    } else {
      return kNone;
    }
  }

  List<Text> _createBloodSugarTexts() {
    return _bloodSugars
        .map((bs) =>
        Text(
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
