import 'package:apprize_mobile_app/services/api_services/login_api_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoginSuccess = false;
  String loginMessage = "";

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
}
