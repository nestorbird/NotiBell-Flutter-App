import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:notibell_mobile_app/services/api_utils/api_paths.dart';
import 'package:notibell_mobile_app/services/api_utils/common_response.dart';

import '../api_utils/api_status.dart';

class InternetService {
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

  static Future<CommanResponse> checkAppStatus() async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String apiPath = ApiPaths.checkAppStatusPath();

        //var apiResponse = await ApiFunctions().getRequest(apiPath);
        var uri = Uri.parse(apiPath);
        var response =
            await http.get((uri)).timeout(const Duration(seconds: 30));

        if (response.statusCode == 200) {
          //bool status = apiResponse["message"];
          return CommanResponse(
              status: true,
              message: true,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false,
              message: false,
              apiStatus: ApiStatus.REQUEST_FAILURE);
        }
      } else {
        return CommanResponse(
            status: false,
            message: "No internet connection",
            apiStatus: ApiStatus.NO_INTERNET);
      }
    } catch (e) {
      return CommanResponse(
          status: false,
          message: e.toString(),
          apiStatus: ApiStatus.REQUEST_FAILURE);
    }
  }
}
