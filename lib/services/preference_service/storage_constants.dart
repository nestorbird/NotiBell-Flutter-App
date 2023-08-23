import 'package:flutter/material.dart';

class StorageConstants {
  ///LOGIN SCREEN
  static String sessionId = "sid";
  static String apiSecret = "apiSecret";
  static String apiKey = "apiKey";
  static String fullName = "full_name";
  static String firstName = "firstName";
  static String dateOfBirth = "dateOfBirth";
  static String pointsEarned = "pointsEarned";
  static String totalPoint = "totalPoint";
  static String lastName = "lastName";
  static String phoneNo = "phoneNo";
  static String userId = "user_id";
  static String userType = "userType";
  static String profilePic = "profile_pic";
  static String isUserLoggedIn = "isUserLoggedIn";
  static String isPremiumMember = "isPremiumAccount";
  static String baseUrl = "baseUrl";
  static String sessionExpires = "Expires";
  static String userRoles = "userRoles";
}

class UserProfile {
  static String? fName;
  static String? lName;
  static String? fullName;
  static String? phoneNo;
  static String? emailID;
  static String? dob;
  static int? pointEarn;
  static double? totalPoint;
  static String? profilePic;

  static void display() {
    debugPrint(
        "fName: $fName, lName: $lName, fullName: $fullName, emailID: $emailID, phoneNo: $phoneNo, DOB: $dob, pointEarn: $pointEarn, totalPoint: $totalPoint, profile_pic:$profilePic");
  }

  static void clear() {
    fName = null;
    lName = null;
    fullName = null;
    phoneNo = null;
    emailID = null;
    dob = null;
    pointEarn = null;
    totalPoint = null;
    profilePic = null;
  }
}
