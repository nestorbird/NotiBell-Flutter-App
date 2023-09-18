class EmployeeDetailModel {
  EmployeeDetailModel({
    required this.data,
  });
  late final Data data;

  EmployeeDetailModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.employee,
    required this.namingSeries,
    required this.firstName,
    required this.lastName,
    required this.employeeName,
    required this.gender,
    required this.dateOfBirth,
    required this.salutation,
    required this.dateOfJoining,
    required this.status,
    required this.customFaceRegistrationData,
    required this.userId,
    required this.createUserPermission,
    required this.company,
    required this.department,
    required this.employmentType,
    required this.designation,
    required this.noticeNumberOfDays,
    required this.dateOfRetirement,
    required this.preferedContactEmail,
    required this.preferedEmail,
    required this.unsubscribed,
    required this.currentAccommodationType,
    required this.permanentAccommodationType,
    required this.expenseApprover,
    required this.leaveApprover,
    required this.shiftRequestApprover,
    required this.ctc,
    required this.salaryCurrency,
    required this.salaryMode,
    required this.maritalStatus,
    required this.bloodGroup,
    required this.leaveEncashed,
    required this.lft,
    required this.rgt,
    required this.oldParent,
    required this.doctype,
    required this.externalWorkHistory,
    required this.internalWorkHistory,
    required this.education,
  });
  late final String name;
  late final String owner;
  late final String creation;
  late final String modified;
  late final String modifiedBy;
  late final String employee;
  late final String namingSeries;
  late final String firstName;
  late final String lastName;
  late final String employeeName;
  late final String gender;
  late final String dateOfBirth;
  late final String salutation;
  late final String dateOfJoining;
  late final String status;
  late final String customFaceRegistrationData;
  late final String userId;
  late final int createUserPermission;
  late final String company;
  late final String department;
  late final String employmentType;
  late final String designation;
  late final int noticeNumberOfDays;
  late final String dateOfRetirement;
  late final String preferedContactEmail;
  late final String preferedEmail;
  late final int unsubscribed;
  late final String currentAccommodationType;
  late final String permanentAccommodationType;
  late final String expenseApprover;
  late final String leaveApprover;
  late final String shiftRequestApprover;
  late final double ctc;
  late final String salaryCurrency;
  late final String salaryMode;
  late final String maritalStatus;
  late final String bloodGroup;
  late final String leaveEncashed;
  late final int lft;
  late final int rgt;
  late final String oldParent;
  late final String doctype;
  late final List<dynamic> externalWorkHistory;
  late final List<dynamic> internalWorkHistory;
  late final List<dynamic> education;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    employee = json['employee'];
    namingSeries = json['naming_series'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    employeeName = json['employee_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    salutation = json['salutation'];
    dateOfJoining = json['date_of_joining'];
    status = json['status'];
    customFaceRegistrationData = json['custom_face_registration_data'] ?? "";
    userId = json['user_id'];
    createUserPermission = json['create_user_permission'];
    company = json['company'];
    department = json['department'];
    employmentType = json['employment_type'];
    designation = json['designation'];
    noticeNumberOfDays = json['notice_number_of_days'];
    dateOfRetirement = json['date_of_retirement'];
    preferedContactEmail = json['prefered_contact_email'];
    preferedEmail = json['prefered_email'];
    unsubscribed = json['unsubscribed'];
    currentAccommodationType = json['current_accommodation_type'];
    permanentAccommodationType = json['permanent_accommodation_type'];
    expenseApprover = json['expense_approver'];
    leaveApprover = json['leave_approver'];
    shiftRequestApprover = json['shift_request_approver'];
    ctc = json['ctc'];
    salaryCurrency = json['salary_currency'];
    salaryMode = json['salary_mode'];
    maritalStatus = json['marital_status'];
    bloodGroup = json['blood_group'];
    leaveEncashed = json['leave_encashed'];
    lft = json['lft'];
    rgt = json['rgt'];
    oldParent = json['old_parent'];
    doctype = json['doctype'];
    externalWorkHistory =
        List.castFrom<dynamic, dynamic>(json['external_work_history']);
    internalWorkHistory =
        List.castFrom<dynamic, dynamic>(json['internal_work_history']);
    education = List.castFrom<dynamic, dynamic>(json['education']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['owner'] = owner;
    _data['creation'] = creation;
    _data['modified'] = modified;
    _data['modified_by'] = modifiedBy;
    _data['employee'] = employee;
    _data['naming_series'] = namingSeries;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['employee_name'] = employeeName;
    _data['gender'] = gender;
    _data['date_of_birth'] = dateOfBirth;
    _data['salutation'] = salutation;
    _data['date_of_joining'] = dateOfJoining;
    _data['status'] = status;
    _data['custom_face_registration_data'] = customFaceRegistrationData;
    _data['user_id'] = userId;
    _data['create_user_permission'] = createUserPermission;
    _data['company'] = company;
    _data['department'] = department;
    _data['employment_type'] = employmentType;
    _data['designation'] = designation;
    _data['notice_number_of_days'] = noticeNumberOfDays;
    _data['date_of_retirement'] = dateOfRetirement;
    _data['prefered_contact_email'] = preferedContactEmail;
    _data['prefered_email'] = preferedEmail;
    _data['unsubscribed'] = unsubscribed;
    _data['current_accommodation_type'] = currentAccommodationType;
    _data['permanent_accommodation_type'] = permanentAccommodationType;
    _data['expense_approver'] = expenseApprover;
    _data['leave_approver'] = leaveApprover;
    _data['shift_request_approver'] = shiftRequestApprover;
    _data['ctc'] = ctc;
    _data['salary_currency'] = salaryCurrency;
    _data['salary_mode'] = salaryMode;
    _data['marital_status'] = maritalStatus;
    _data['blood_group'] = bloodGroup;
    _data['leave_encashed'] = leaveEncashed;
    _data['lft'] = lft;
    _data['rgt'] = rgt;
    _data['old_parent'] = oldParent;
    _data['doctype'] = doctype;
    _data['external_work_history'] = externalWorkHistory;
    _data['internal_work_history'] = internalWorkHistory;
    _data['education'] = education;
    return _data;
  }
}
