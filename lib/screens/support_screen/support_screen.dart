import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  WebViewController controller = WebViewController()
    ..loadRequest(Uri.parse("https://www.google.com"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support Screen"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
