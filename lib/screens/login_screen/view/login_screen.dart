// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notibell_mobile_app/common_widgets/buttons/long_button_widget.dart';
import 'package:notibell_mobile_app/common_widgets/snackbar/snackbar_widget.dart';
import 'package:notibell_mobile_app/common_widgets/textfield/password_input_field.dart';
import 'package:notibell_mobile_app/common_widgets/textfield/text_input_field.dart';
import 'package:notibell_mobile_app/screens/login_screen/provider/login_provider.dart';
import 'package:notibell_mobile_app/utils/string_res/app_strings.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/popups/simple_popup.dart';
import '../../../utils/asset_res/asset_paths.dart';
import '../../home_screen/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _urlController,
      _emailController,
      _passwordController;

  late LoginProvider _loginProvider;

  @override
  void initState() {
    _initControllers();
    _checkForPushNotificationPermission();
    _loginProvider = Provider.of(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  _initControllers() {
    _urlController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    // _urlController.text = "nb-apprize.frappe.cloud";
    _urlController.text = "notibell.nestorbird.com";
    _emailController.text = "gaurav@yopmail.com";
    _passwordController.text = "Test@123";
  }

  _disposeControllers() {
    _urlController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  _checkForPushNotificationPermission() async {
    if (Platform.isIOS) {
      FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
      firebaseMessaging.requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, value, _) {
      return SafeArea(
        child: Scaffold(
          body: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AssetPaths.signInBackgroundImg),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 90,
                              width: 90,
                              child: Image.asset(AssetPaths.appLogo2)),
                          Text(
                            AppStrings.signInTitleTxt,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  const SizedBox(height: 20),
                  _loginForm
                ],
              ))),
        ),
      );
    });
  }

  Widget get _loginForm {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          TextInputField(
            textController: _urlController,
            textInputType: TextInputType.url,
            hintText: AppStrings.linkTxt,
            labelText: AppStrings.linkTxt,
          ),
          const SizedBox(height: 30),
          TextInputField(
            textController: _emailController,
            textInputType: TextInputType.emailAddress,
            hintText: AppStrings.emailTxt,
            labelText: AppStrings.emailTxt,
          ),
          const SizedBox(height: 30),
          PasswordInputField(
            textController: _passwordController,
            textInputType: TextInputType.emailAddress,
            hintText: AppStrings.passwordTxt,
            labelText: AppStrings.passwordTxt,
          ),
          const SizedBox(height: 30),
          // Align(
          //     alignment: Alignment.centerRight,
          //     child: Text(
          //       AppStrings.forgotPasswordTxt,
          //       style: TextStyle(
          //           color: AppColors.blueThemeColor,
          //           fontSize: 13,
          //           fontWeight: FontWeight.bold),
          //     )),
          // const SizedBox(height: 30),
          LongButtonWidget(
              buttonText: AppStrings.loginTxt,
              onPressed: () => _loginButtonHandler())
        ],
      ),
    );
  }

  _loginButtonHandler() async {
    await _loginProvider.checkInstanceRunningStatus();

    if (_loginProvider.isInstanceRunning) {
      await _loginProvider.login(
          _urlController.text, _emailController.text, _passwordController.text);
      if (_loginProvider.isLoginSuccess) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        SnackbarWidget.showSnackBar(context, _loginProvider.loginMessage);
      }
    } else {
      await showGeneralDialog(
          context: context,
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return SizedBox(
              height: 100,
              child: SimplePopup(
                message: AppStrings.updateMessageTxt,
                buttonText: AppStrings.okTxt,
                onOkPressed: () {
                  exit(0);
                },
              ),
            );
          });
    }
  }
}
