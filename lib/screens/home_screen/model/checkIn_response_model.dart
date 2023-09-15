// To parse this JSON data, do
//
//     final checkInResponseModel = checkInResponseModelFromJson(jsonString);

import 'dart:convert';

CheckInResponseModel checkInResponseModelFromJson(String str) =>
    CheckInResponseModel.fromJson(json.decode(str));

String checkInResponseModelToJson(CheckInResponseModel data) =>
    json.encode(data.toJson());

class CheckInResponseModel {
  String? excType;
  Data? data;

  CheckInResponseModel({
    this.excType,
    this.data,
  });

  factory CheckInResponseModel.fromJson(Map<String, dynamic> json) =>
      CheckInResponseModel(
        excType: json["exc_type"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "exc_type": excType,
        "data": data!.toJson(),
      };
}

class Data {
  String? name;
  String? owner;
  DateTime? creation;
  DateTime? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? employee;
  String? employeeName;
  String? logType;
  dynamic shift;
  DateTime? time;
  dynamic deviceId;
  int? skipAutoAttendance;
  dynamic attendance;
  dynamic shiftStart;
  dynamic shiftEnd;
  dynamic shiftActualStart;
  dynamic shiftActualEnd;
  String? customFaceDetection;
  int? customFaceStatus;
  String? customLatitude;
  String? customLongitude;
  int? customLocationStatus;
  String? doctype;

  Data({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.employee,
    this.employeeName,
    this.logType,
    this.shift,
    this.time,
    this.deviceId,
    this.skipAutoAttendance,
    this.attendance,
    this.shiftStart,
    this.shiftEnd,
    this.shiftActualStart,
    this.shiftActualEnd,
    this.customFaceDetection,
    this.customFaceStatus,
    this.customLatitude,
    this.customLongitude,
    this.customLocationStatus,
    this.doctype,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        owner: json["owner"],
        creation: DateTime.parse(json["creation"]),
        modified: DateTime.parse(json["modified"]),
        modifiedBy: json["modified_by"],
        docstatus: json["docstatus"],
        idx: json["idx"],
        employee: json["employee"],
        employeeName: json["employee_name"],
        logType: json["log_type"],
        shift: json["shift"],
        time: DateTime.parse(json["time"]),
        deviceId: json["device_id"],
        skipAutoAttendance: json["skip_auto_attendance"],
        attendance: json["attendance"],
        shiftStart: json["shift_start"],
        shiftEnd: json["shift_end"],
        shiftActualStart: json["shift_actual_start"],
        shiftActualEnd: json["shift_actual_end"],
        customFaceDetection: json["custom_face_detection"],
        customFaceStatus: json["custom_face_status"],
        customLatitude: json["custom_latitude"],
        customLongitude: json["custom_longitude"],
        customLocationStatus: json["custom_location_status"],
        doctype: json["doctype"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation!.toIso8601String(),
        "modified": modified!.toIso8601String(),
        "modified_by": modifiedBy,
        "docstatus": docstatus,
        "idx": idx,
        "employee": employee,
        "employee_name": employeeName,
        "log_type": logType,
        "shift": shift,
        "time": time!.toIso8601String(),
        "device_id": deviceId,
        "skip_auto_attendance": skipAutoAttendance,
        "attendance": attendance,
        "shift_start": shiftStart,
        "shift_end": shiftEnd,
        "shift_actual_start": shiftActualStart,
        "shift_actual_end": shiftActualEnd,
        "custom_face_detection": customFaceDetection,
        "custom_face_status": customFaceStatus,
        "custom_latitude": customLatitude,
        "custom_longitude": customLongitude,
        "custom_location_status": customLocationStatus,
        "doctype": doctype,
      };
}
