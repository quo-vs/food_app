import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fooderlich/models/foderlich_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({ Key? key }) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: FooderlichPages.raywenderlichPath,
      key: ValueKey(FooderlichPages.raywenderlichPath),
      child: const WebViewScreen(),
    );
  }

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  
  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('raywe'),
      ),
      body: const WebView(initialUrl:  'https://www.raywenderlich.com/',),
    );
  }
}