// To parse this JSON data, do
//
//     final employeeCheckinStatusResponse = employeeCheckinStatusResponseFromJson(jsonString);

import 'dart:convert';

EmployeeCheckinStatusResponse employeeCheckinStatusResponseFromJson(String str) => EmployeeCheckinStatusResponse.fromJson(json.decode(str));

String employeeCheckinStatusResponseToJson(EmployeeCheckinStatusResponse data) => json.encode(data.toJson());

class EmployeeCheckinStatusResponse {
    List<Datum>? data;

    EmployeeCheckinStatusResponse({
        this.data,
    });

    factory EmployeeCheckinStatusResponse.fromJson(Map<String, dynamic> json) => EmployeeCheckinStatusResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? logType;
    String? employee;
    DateTime? time;

    Datum({
        this.logType,
        this.employee,
        this.time,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        logType: json["log_type"],
        employee: json["employee"],
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "log_type": logType,
        "employee": employee,
        "time": time!.toIso8601String(),
    };
}
