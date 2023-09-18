// To parse this JSON data, do
//
//     final faceRegistrationRequestModel = faceRegistrationRequestModelFromJson(jsonString);

import 'dart:convert';

FaceRegistrationRequestModel faceRegistrationRequestModelFromJson(String str) {
  final jsonData = json.decode(str);
  return FaceRegistrationRequestModel.fromJson(jsonData);
}

String faceRegistrationRequestModelToJson(FaceRegistrationRequestModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class FaceRegistrationRequestModel {
  String? userImageFile;
  String? customFaceRegistrationData;

  FaceRegistrationRequestModel({
    this.userImageFile,
    this.customFaceRegistrationData,
  });

  factory FaceRegistrationRequestModel.fromJson(Map<String, dynamic> json) =>
      FaceRegistrationRequestModel(
        userImageFile: json["user_image_file"],
        customFaceRegistrationData: json["custom_face_registration_data"],
      );

  Map<String, dynamic> toJson() => {
        "user_image_file": userImageFile,
        "custom_face_registration_data": customFaceRegistrationData,
      };
}
