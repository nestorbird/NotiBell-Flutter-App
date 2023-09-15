import 'dart:convert';
import 'dart:developer';
import 'package:notibell_mobile_app/services/api_utils/api_paths.dart';
import 'package:notibell_mobile_app/services/api_utils/api_status.dart';
import 'package:notibell_mobile_app/services/api_utils/common_response.dart';
import 'package:notibell_mobile_app/services/internet_connection/internet_service.dart';
import 'package:notibell_mobile_app/services/preference_service/storage_constants.dart';
import 'package:notibell_mobile_app/services/preference_service/storage_helper.dart';
import '../../screens/sign_up_screen/model/face_regisreation_request_model.dart';
import '../../screens/sign_up_screen/model/face_registration_response.dart';
import '../api_utils/api_functions.dart';

class FaceSignUpService {
  Future<CommanResponse> faceSignUp(
      FaceRegistrationRequestModel faceRegistrationReq,
      String docType,
      String docId) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();
      String baseUrl =
          await StorageHelper().getStringValues(StorageConstants.baseUrl) ?? "";
      if (isInternetAvailable) {
        var request = faceRegistrationReq.toJson();
        var apiResponse = await ApiFunctions().putRequest(
            ApiPaths.faceRegistrationPath(baseUrl, "Employee", docId), request,
            enableHeader: true);
        print("Image Registration ::::");
        log(json.encode(apiResponse));

        FaceRegistrationResponseModel faceRegistrationResponse =
            FaceRegistrationResponseModel.fromJson(apiResponse);
         log(faceRegistrationResponse.toString());
        if (apiResponse.isNotEmpty) {
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
}
