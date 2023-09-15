// To parse this JSON data, do
//
//     final faceRegistrationResponseModel = faceRegistrationResponseModelFromJson(jsonString);

import 'dart:convert';

FaceRegistrationResponseModel faceRegistrationResponseModelFromJson(
    String str) {
  final jsonData = json.decode(str);
  return FaceRegistrationResponseModel.fromJson(jsonData);
}

String faceRegistrationResponseModelToJson(FaceRegistrationResponseModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class FaceRegistrationResponseModel {
  Data? data;

  FaceRegistrationResponseModel({
    this.data,
  });

  factory FaceRegistrationResponseModel.fromJson(Map<String, dynamic> json) =>
      FaceRegistrationResponseModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? employee;
  String? namingSeries;
  String? firstName;
  String? lastName;
  String? employeeName;
  String? gender;
  String? dateOfBirth;
  String? salutation;
  String? dateOfJoining;
  String? status;
  String? customFaceRegistration;
  String? customFaceRegistrationData;
  String? userId;
  int? createUserPermission;
  String? company;
  String? department;
  String? employmentType;
  String? designation;
  String? reportsTo;
  String? branch;
  String? grade;
  int? noticeNumberOfDays;
  String? dateOfRetirement;
  String? cellNumber;
  String? personalEmail;
  String? companyEmail;
  String? preferedContactEmail;
  String? preferedEmail;
  int? unsubscribed;
  String? currentAddress;
  String? currentAccommodationType;
  String? permanentAddress;
  String? permanentAccommodationType;
  String? personToBeContacted;
  String? emergencyPhoneNumber;
  String? relation;
  String? leaveApprover;
  double? ctc;
  String? salaryCurrency;
  String? salaryMode;
  String? maritalStatus;
  String? bloodGroup;
  String? passportNumber;
  String? validUpto;
  String? dateOfIssue;
  String? placeOfIssue;
  String? leaveEncashed;
  int? lft;
  int? rgt;
  String? oldParent;
  String? doctype;
  List<dynamic>? internalWorkHistory;
  List<dynamic>? externalWorkHistory;
  List<dynamic>? education;

  Data({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.employee,
    this.namingSeries,
    this.firstName,
    this.lastName,
    this.employeeName,
    this.gender,
    this.dateOfBirth,
    this.salutation,
    this.dateOfJoining,
    this.status,
    this.customFaceRegistration,
    this.customFaceRegistrationData,
    this.userId,
    this.createUserPermission,
    this.company,
    this.department,
    this.employmentType,
    this.designation,
    this.reportsTo,
    this.branch,
    this.grade,
    this.noticeNumberOfDays,
    this.dateOfRetirement,
    this.cellNumber,
    this.personalEmail,
    this.companyEmail,
    this.preferedContactEmail,
    this.preferedEmail,
    this.unsubscribed,
    this.currentAddress,
    this.currentAccommodationType,
    this.permanentAddress,
    this.permanentAccommodationType,
    this.personToBeContacted,
    this.emergencyPhoneNumber,
    this.relation,
    this.leaveApprover,
    this.ctc,
    this.salaryCurrency,
    this.salaryMode,
    this.maritalStatus,
    this.bloodGroup,
    this.passportNumber,
    this.validUpto,
    this.dateOfIssue,
    this.placeOfIssue,
    this.leaveEncashed,
    this.lft,
    this.rgt,
    this.oldParent,
    this.doctype,
    this.internalWorkHistory,
    this.externalWorkHistory,
    this.education,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        owner: json["owner"],
        creation: json["creation"],
        modified: json["modified"],
        modifiedBy: json["modified_by"],
        docstatus: json["docstatus"],
        idx: json["idx"],
        employee: json["employee"],
        namingSeries: json["naming_series"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        employeeName: json["employee_name"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        salutation: json["salutation"],
        dateOfJoining: json["date_of_joining"],
        status: json["status"],
        customFaceRegistration: json["custom_face_registration"],
        customFaceRegistrationData: json["custom_face_registration_data"],
        userId: json["user_id"],
        createUserPermission: json["create_user_permission"],
        company: json["company"],
        department: json["department"],
        employmentType: json["employment_type"],
        designation: json["designation"],
        reportsTo: json["reports_to"],
        branch: json["branch"],
        grade: json["grade"],
        noticeNumberOfDays: json["notice_number_of_days"],
        dateOfRetirement: json["date_of_retirement"],
        cellNumber: json["cell_number"],
        personalEmail: json["personal_email"],
        companyEmail: json["company_email"],
        preferedContactEmail: json["prefered_contact_email"],
        preferedEmail: json["prefered_email"],
        unsubscribed: json["unsubscribed"],
        currentAddress: json["current_address"],
        currentAccommodationType: json["current_accommodation_type"],
        permanentAddress: json["permanent_address"],
        permanentAccommodationType: json["permanent_accommodation_type"],
        personToBeContacted: json["person_to_be_contacted"],
        emergencyPhoneNumber: json["emergency_phone_number"],
        relation: json["relation"],
        leaveApprover: json["leave_approver"],
        ctc: json["ctc"],
        salaryCurrency: json["salary_currency"],
        salaryMode: json["salary_mode"],
        maritalStatus: json["marital_status"],
        bloodGroup: json["blood_group"],
        passportNumber: json["passport_number"],
        validUpto: json["valid_upto"],
        dateOfIssue: json["date_of_issue"],
        placeOfIssue: json["place_of_issue"],
        leaveEncashed: json["leave_encashed"],
        lft: json["lft"],
        rgt: json["rgt"],
        oldParent: json["old_parent"],
        doctype: json["doctype"],
        internalWorkHistory:
            List<dynamic>.from(json["internal_work_history"].map((x) => x)),
        externalWorkHistory:
            List<dynamic>.from(json["external_work_history"].map((x) => x)),
        education: List<dynamic>.from(json["education"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation,
        "modified": modified,
        "modified_by": modifiedBy,
        "docstatus": docstatus,
        "idx": idx,
        "employee": employee,
        "naming_series": namingSeries,
        "first_name": firstName,
        "last_name": lastName,
        "employee_name": employeeName,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "salutation": salutation,
        "date_of_joining": dateOfJoining,
        "status": status,
        "custom_face_registration": customFaceRegistration,
        "custom_face_registration_data": customFaceRegistrationData,
        "user_id": userId,
        "create_user_permission": createUserPermission,
        "company": company,
        "department": department,
        "employment_type": employmentType,
        "designation": designation,
        "reports_to": reportsTo,
        "branch": branch,
        "grade": grade,
        "notice_number_of_days": noticeNumberOfDays,
        "date_of_retirement": dateOfRetirement,
        "cell_number": cellNumber,
        "personal_email": personalEmail,
        "company_email": companyEmail,
        "prefered_contact_email": preferedContactEmail,
        "prefered_email": preferedEmail,
        "unsubscribed": unsubscribed,
        "current_address": currentAddress,
        "current_accommodation_type": currentAccommodationType,
        "permanent_address": permanentAddress,
        "permanent_accommodation_type": permanentAccommodationType,
        "person_to_be_contacted": personToBeContacted,
        "emergency_phone_number": emergencyPhoneNumber,
        "relation": relation,
        "leave_approver": leaveApprover,
        "ctc": ctc,
        "salary_currency": salaryCurrency,
        "salary_mode": salaryMode,
        "marital_status": maritalStatus,
        "blood_group": bloodGroup,
        "passport_number": passportNumber,
        "valid_upto": validUpto,
        "date_of_issue": dateOfIssue,
        "place_of_issue": placeOfIssue,
        "leave_encashed": leaveEncashed,
        "lft": lft,
        "rgt": rgt,
        "old_parent": oldParent,
        "doctype": doctype,
        "internal_work_history":
            List<dynamic>.from(internalWorkHistory!.map((x) => x)),
        "external_work_history":
            List<dynamic>.from(externalWorkHistory!.map((x) => x)),
        "education": List<dynamic>.from(education!.map((x) => x)),
      };
}
