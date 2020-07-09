import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatelessWidget {
  final String url;

  const ArticleScreen({
    Key key,
    @required this.url,
  }) : super(key: key);

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
      backgroundColor: Colors.white,
      body: WebView(
        onWebViewCreated: (controller) => controller.loadUrl(url),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
