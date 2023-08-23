import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService{
  static bool isLoggedIn = false;

  ///Function to check internet connectivity in app.
  static Future<bool> isNetworkAvailable() async {
    //Checking for the connectivity
    var connection = await Connectivity().checkConnectivity();

    //If connected to mobile data or wifi
    if (connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi) {
      //Returning result as true
      return true;
    } else {
      //Returning result as false
      return false;
    }
  }
}