import 'dart:developer';

import 'package:apprize_mobile_app/services/api_services/push_notification_service.dart';
import 'package:apprize_mobile_app/services/api_utils/api_paths.dart';
import 'package:apprize_mobile_app/services/api_utils/api_status.dart';
import 'package:apprize_mobile_app/services/api_utils/common_response.dart';
import 'package:apprize_mobile_app/services/firebase_service/firebase_config.dart';
import 'package:apprize_mobile_app/services/internet_connection/internet_service.dart';
import 'package:apprize_mobile_app/services/preference_service/storage_constants.dart';
import 'package:apprize_mobile_app/services/preference_service/storage_helper.dart';

import '../api_utils/api_functions.dart';

class LoginService {
  Future<CommanResponse> login(
      String baseUrl, String username, String password) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        //Check for the url here

        if (!baseUrl.contains("https")) {
          baseUrl = "https://$baseUrl";
        }

        // if (!_isValidUrl(baseUrl)) {
        //   return CommanResponse(
        //       status: false,
        //       message: "Instance URL format is invalid",
        //       apiStatus: ApiStatus.NO_INTERNET);
        // }

        var request = <String, dynamic>{};

        request["usr"] = username;
        request["pwd"] = password;

        var apiResponse = await ApiFunctions().postRequestWithResponseHeaders(
            ApiPaths.loginPath(baseUrl), request);
        log("$apiResponse");
        if (apiResponse.statusCode == 200) {
          String rawCookie = apiResponse.headers['set-cookie']!;
          log(rawCookie);
          var cookieList = rawCookie.split(";");
          for (var cookie in cookieList) {
            if (cookie.contains("user_id") ||
                cookie.contains("full_name") ||
                cookie.contains("Expires") ||
                cookie.contains("sid") ||
                cookie.contains("user_image")) {
              cookie = cookie.replaceAll("SameSite=Lax,", "").trim();
              int index = cookie.lastIndexOf("=");
              String key = cookie.substring(0, index);
              String value = cookie.substring(index + 1, cookie.length);
              StorageHelper().setStringValue(key, Uri.decodeFull(value));
            }
          }

          StorageHelper().setStringValue(StorageConstants.baseUrl, baseUrl);

          await FirebaseConfig().generateFCMToken();
          await getUserRole();
          await PushNotificationService.sendToken(FirebaseConfig.getToken());

          return CommanResponse(
              status: true,
              message: apiResponse,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false, message: '', apiStatus: ApiStatus.REQUEST_FAILURE);
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

  static bool _isValidUrl(String url) {
    // Regex to check valid URL
    String regex =
        "((http|https)://)(www.)?[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)";
    return RegExp(regex).hasMatch(url);
  }

  // Future<CommanResponse> checkUrl(String apiUrl) async {
  //   var isInternetAvailable = await InternetService.isNetworkAvailable();

  //   if (isInternetAvailable) {

  //   } else {
  //     return CommanResponse(
  //       status: false,
  //       message: "No internet connection",
  //       apiStatus: ApiStatus.NO_INTERNET
  //     );
  //   }

  Future<CommanResponse> getUserRole() async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String? email =
            await StorageHelper().getStringValues(StorageConstants.userId);
        String? baseurl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl);

        var apiResponse = await ApiFunctions()
            .getRequest(ApiPaths.getUserRolePath(baseurl!, email!));

        List<dynamic> response = apiResponse["data"]["roles"];

        List<String> roles = [];

        for (var data in response) {
          Map<String, dynamic> role = data as Map<String, dynamic>;
          roles.add(role["role"] ?? "");
        }

        StorageHelper().setStringLists(StorageConstants.userRoles, roles);

        return CommanResponse(
            status: true,
            message: apiResponse,
            apiStatus: ApiStatus.REQUEST_SUCCESS);
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
