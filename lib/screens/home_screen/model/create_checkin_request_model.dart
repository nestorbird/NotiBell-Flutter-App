// To parse this JSON data, do
//
//     final createCheckInRequestModel = createCheckInRequestModelFromJson(jsonString);

import 'dart:convert';

CreateCheckInRequestModel createCheckInRequestModelFromJson(String str) =>
    CreateCheckInRequestModel.fromJson(json.decode(str));

String createCheckInRequestModelToJson(CreateCheckInRequestModel data) =>
    json.encode(data.toJson());

class CreateCheckInRequestModel {
  Data? data;

  CreateCheckInRequestModel({
    this.data,
  });

  factory CreateCheckInRequestModel.fromJson(Map<String, dynamic> json) =>
      CreateCheckInRequestModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  String? employee;
  String? logType;
  DateTime? time;
  int? customFaceStatus;
  String? customLatitude;
  String? customLongitude;
  String? userImageFile;
  String? customFaceRegistrationData;

  Data({
    this.employee,
    this.logType,
    this.time,
    this.customFaceStatus,
    this.customLatitude = "0.0",
    this.customLongitude = "0.0",
    this.userImageFile,
    this.customFaceRegistrationData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        employee: json["employee"],
        logType: json["log_type"],
        time: DateTime.parse(json["time"]),
        customFaceStatus: json["custom_face_status"],
        customLatitude: json["custom_latitude"],
        customLongitude: json["custom_longitude"],
        userImageFile: json["user_image_file"],
        customFaceRegistrationData: json["custom_face_registration_data"],
      );

  Map<String, dynamic> toJson() => {
        "employee": employee,
        "log_type": logType,
        "time": time!.toIso8601String(),
        "custom_face_status": customFaceStatus,
        "custom_latitude": customLatitude,
        "custom_longitude": customLongitude,
        "user_image_file": userImageFile,
        "custom_face_registration_data": customFaceRegistrationData,
      };
}
