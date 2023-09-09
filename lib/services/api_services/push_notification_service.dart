import 'package:notibell_mobile_app/services/api_utils/common_response.dart';
import 'package:notibell_mobile_app/services/preference_service/storage_constants.dart';
import 'package:notibell_mobile_app/services/preference_service/storage_helper.dart';

import '../api_utils/api_functions.dart';
import '../api_utils/api_paths.dart';
import '../api_utils/api_status.dart';
import '../internet_connection/internet_service.dart';

class PushNotificationService {
  static Future<CommanResponse> sendToken(String deviceToken) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String? userId =
            await StorageHelper().getStringValues(StorageConstants.userId);

        var request = {
          "data": {"device_token": deviceToken, "user": userId}
        };

        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";

        var apiResponse = await ApiFunctions()
            .postRequest(ApiPaths.sendDeviceTokenForPush(baseUrl), request);

        String storedToken = apiResponse["data"]["device_token"];

        if (deviceToken == storedToken) {
          return CommanResponse(
              status: true,
              message: apiResponse,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false,
              message: apiResponse,
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
