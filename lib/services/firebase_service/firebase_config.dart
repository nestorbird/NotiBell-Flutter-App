import 'package:firebase_messaging/firebase_messaging.dart';

String? fcmToken = "";

class FirebaseConfig {
  Future<void> generateFCMToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
  }

  static String getToken() {
    return fcmToken ?? "";
  }
}
