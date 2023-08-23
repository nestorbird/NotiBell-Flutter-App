import 'dart:async';

import 'package:apprize_mobile_app/services/preference_service/storage_constants.dart';
import 'package:apprize_mobile_app/services/preference_service/storage_helper.dart';
import 'package:apprize_mobile_app/utils/asset_res/asset_paths.dart';
import 'package:apprize_mobile_app/utils/string_res/app_strings.dart';
import 'package:flutter/material.dart';

import '../../home_screen/view/home_screen.dart';
import '../../login_screen/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isUserLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _updateScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetPaths.splashBackgroundImg),
              fit: BoxFit.cover),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(AssetPaths.appIcon)),
            const SizedBox(height: 10),
            Text(
              AppStrings.appName,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        )),
      ),
    ));
  }

  _updateScreen() async {
    var sessionId =
        await StorageHelper().getStringValues(StorageConstants.sessionId);
    if (sessionId!.isEmpty) {
      Timer(
          const Duration(seconds: 1),
          (() => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()))));
    } else {
      Timer(
          const Duration(seconds: 1),
          (() => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()))));
    }
  }
}
