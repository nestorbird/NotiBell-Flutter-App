import 'package:flutter/material.dart';
import 'package:notibell_mobile_app/services/api_services/login_api_service.dart';
import 'package:notibell_mobile_app/services/internet_connection/internet_service.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoginSuccess = false;
  String loginMessage = "";
  bool isInstanceRunning = false;

  Future<void> login(String url, String username, String password) async {
    var response = await LoginService().login(url, username, password);
    if (response.status!) {
      isLoginSuccess = true;
    } else {
      isLoginSuccess = false;
      loginMessage = response.message;
    }
    notifyListeners();
  }

   Future<void> getEmployeeId(String url, String username, String password) async {
    var response = await LoginService().login(url, username, password);
    if (response.status!) {
      isLoginSuccess = true;
    } else {
      isLoginSuccess = false;
      loginMessage = response.message;
    }
    notifyListeners();
  }

  Future<void> checkInstanceRunningStatus() async {
    var response = await InternetService.checkAppStatus();

    if (response.status!) {
      isInstanceRunning = response.message;
    } else {
      isInstanceRunning = response.message;
    }

    notifyListeners();
  }
}
