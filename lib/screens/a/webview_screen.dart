import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {
  static const String htmlTemplate = '''
<!doctype html>
<html lang="ko">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<style>
table {
  border-collapse: collapse;
}
th {
  background-color: lightpink;
}
td {
  text-align:center;
}
.bottom {
  background-color: lightgreen;
}
</style>
<body>
<table border="1" width="100%"">
  <tr>
    <th>No.</th>
    <th>Name</th>
    <th>Math</th>
    <th>Eng</th>
    <th>Kor</th>
    <th>Sum</th>
  </tr>
  <tr>
    <td>1</td>
    <td>lee</td>
    <td>90</td>
    <td>95</td>
    <td>88</td>
    <td>273</td>
  </tr>
  <tr>
    <td>2</td>
    <td>kim</td>
    <td>100</td>
    <td>89</td>
    <td>85</td>
    <td>274</td>
  </tr>
  <tr>
    <td>3</td>
    <td>kim2</td>
    <td>76</td>
    <td>67</td>
    <td>80</td>
    <td>223</td>
  </tr>
  <tr>
    <td>4</td>
    <td>park</td>
    <td>97</td>
    <td>99</td>
    <td>100</td>
    <td>296</td>
  </tr>
  <tr class="bottom">
    <td colspan="2">Sum</td>
    <td>363</td>
    <td>350</td>
    <td>353</td>
    <td></td>
  </tr>
</table>
</body>
</html>''';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Webview Screen'),
        ),
        body: WebView(
          javascriptMode: JavascriptMode.disabled,
          onWebViewCreated: (WebViewController webViewController) {
            webViewController.loadUrl(Uri.dataFromString(
              htmlTemplate,
              mimeType: 'text/html',
            ).toString());
          },
        ),
      ),
    );
  }
}
