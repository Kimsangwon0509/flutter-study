import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {
  WebviewScreen({this.htmlContent});

  final htmlContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Webview Screen'),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.disabled,
        onWebViewCreated: (WebViewController webViewController) {
          webViewController.loadUrl(Uri.dataFromString(
            htmlContent,
            mimeType: 'text/html',
          ).toString());
        },
      ),
    );
  }
}
