import 'dart:convert';

import 'package:notibell_mobile_app/screens/home_screen/model/employee_details_model.dart';
import 'package:notibell_mobile_app/screens/sign_up_screen/model/face_regisreation_request_model.dart';
import 'package:notibell_mobile_app/services/api_services/employee_service.dart';
import 'package:notibell_mobile_app/services/api_utils/api_status.dart';
import 'package:flutter/material.dart';

import '../../../services/api_services/sign_up_face.dart';
import '../../../services/preference_service/storage_constants.dart';
import '../../../services/preference_service/storage_helper.dart';
import '../../../utils/db/databse_helper.dart';
import '../../../utils/models/user.model.dart';

class HomeScreenProvider extends ChangeNotifier {
  String? loggedInUserName = "";
  String? loggedInUserEmail = "";
  String? profileImageUrl = "";
  bool isLoading = false;
  bool faceApiResponse = false;
  String employeeId = "";
  bool isEmployee = false;
  EmployeeDetailModel? employeeDetailModel;
  bool isFaceRegistered = false;
  bool isCheckedIn = false;

  isUserCheckedIn() async {
    isCheckedIn =
        await StorageHelper().getBoolValues(StorageConstants.isUserCheckedIn);
    notifyListeners();
  }

  getUserData() async {
    loggedInUserName =
        await StorageHelper().getStringValues(StorageConstants.fullName);
    profileImageUrl =
        await StorageHelper().getStringValues(StorageConstants.profilePic);
    loggedInUserEmail =
        await StorageHelper().getStringValues(StorageConstants.userId);
    notifyListeners();
  }

  Future<void> getEmployeeId() async {
    isLoading = true;

    String? emailId =
        await StorageHelper().getStringValues(StorageConstants.userId);

    var response = await EmployeeService.getEmployeeId(emailId!);

    if (response.apiStatus == ApiStatus.REQUEST_SUCCESS) {
      employeeId = response.message;
      StorageHelper().setStringValue(StorageConstants.employeeId, employeeId);
      isEmployee = true;
      isLoading = false;
      getEmployeeDetails();
    } else {
      employeeId = "";
      isEmployee = false;
      isLoading = false;
    }
  }

  Future<void> getEmployeeDetails() async {
    isLoading = true;

    var response = await EmployeeService.getEmployeeDetails(employeeId);

    if (response.apiStatus == ApiStatus.REQUEST_SUCCESS) {
      employeeDetailModel = response.message;
      if (employeeDetailModel!.data.customFaceRegistrationData.isNotEmpty) {
        var registeredFaceData =
            employeeDetailModel!.data.customFaceRegistrationData;
        var data = json.decode(registeredFaceData).cast<double>().toList();

        DatabaseHelper databaseHelper = DatabaseHelper.instance;
        List<double> fetchedFacedata = List<double>.from(data);

        User userToSave = User(
          user: "",
          password: "",
          modelData: fetchedFacedata,
        );
        await databaseHelper.insert(userToSave);

        // StorageHelper().setDoubleValue(StorageConstants.registeredFaceData,
        //     double.parse(registeredFaceData));
        isFaceRegistered = true;
      }
    } else {
      employeeDetailModel = null;
      isFaceRegistered = false;
    }
    notifyListeners();
  }

  Future<void> createFaceRegistration(
      FaceRegistrationRequestModel faceRegistrationReq,
      String docType,
      String docId) async {
    isLoading = true;
    var response = await FaceSignUpService()
        .faceSignUp(faceRegistrationReq, docType, docId);

    if (response.status!) {
      faceApiResponse = true;
      isLoading = false;
    } else {
      faceApiResponse = false;
      isLoading = false;
    }
    notifyListeners();
  }
}
