import 'package:flutter/material.dart';
import 'package:notibell_mobile_app/utils/color_res/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  WebViewController controller = WebViewController()
    ..loadRequest(Uri.parse("https://nestorbird.com/notibell/"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackThemeColor,
        title: const Text("Support"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
