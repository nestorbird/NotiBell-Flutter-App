import 'package:notibell_mobile_app/screens/home_screen/model/employee_details_model.dart';

import '../../screens/home_screen/model/checkIn_response_model.dart';
import '../../screens/home_screen/model/create_checkin_request_model.dart';
import '../../screens/home_screen/model/employee_checkIn_status.dart';
import '../api_utils/api_functions.dart';
import '../api_utils/api_paths.dart';
import '../api_utils/api_status.dart';
import '../api_utils/common_response.dart';
import '../internet_connection/internet_service.dart';
import '../preference_service/storage_constants.dart';
import '../preference_service/storage_helper.dart';

class EmployeeService {
  static Future<CommanResponse> getEmployeeId(String userEmailId) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";
        const endpoint = "/api/resource/Employee";
        final filters = '[["user_id","=","$userEmailId"]]';

        String apiPath = ApiPaths.getEmployeeIdPath(baseUrl, endpoint, filters);

        var apiResponse = await ApiFunctions().getRequest(apiPath);

        List<dynamic> employeesList = apiResponse["data"];

        String employeeId = "";

        for (var element in employeesList) {
          employeeId = element["name"];
        }

        if (employeeId != null) {
          return CommanResponse(
              status: true,
              message: employeeId,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false,
              message: "No data found",
              apiStatus: ApiStatus.NO_DATA_AVAILABLE);
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

  static Future<CommanResponse> getEmployeeDetails(String employeeId) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";

        String apiPath = ApiPaths.getEmployeeDetailsPath(baseUrl, employeeId);

        var apiResponse = await ApiFunctions().getRequest(apiPath);

        if (apiResponse.isNotEmpty) {
          var response = EmployeeDetailModel.fromJson(apiResponse);

          return CommanResponse(
              status: true,
              message: response,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false,
              message: "No data found",
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

  static Future<CommanResponse> createCheckin(
      CreateCheckInRequestModel checkInModel) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";
        const endpoint = "/api/resource/Employee Checkin";

        var checkInRequest = checkInModel.toJson();
        String apiPath = ApiPaths.createEmployeeCheckin(
          baseUrl,
          endpoint,
        );

        var apiResponse = await ApiFunctions().postRequest(apiPath, checkInRequest);

        if (apiResponse.isNotEmpty) {
          var response = CheckInResponseModel.fromJson(apiResponse);

          return CommanResponse(
              status: true,
              message: response,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false,
              message: "No data found",
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

  static Future<CommanResponse> getEmployeeCheckInStatus(
      String employeeId) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";
        const endpoint = "/api/resource/Employee Checkin";
        final filters =
            '[["employee","=","$employeeId"],["log_type","=","OUT"]]';
        const feilds = '["log_type", "employee","time"]';

        String apiPath = ApiPaths.getEmployeeCheckInStatus(
            baseUrl, endpoint, filters, feilds);

        var apiResponse = await ApiFunctions().getRequest(apiPath);

        if (apiResponse.isNotEmpty) {
          var response = EmployeeCheckinStatusResponse.fromJson(apiResponse);

          return CommanResponse(
              status: true,
              message: response,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false,
              message: "No data found",
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
