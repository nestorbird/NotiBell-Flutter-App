class ApprovalsListModel {
  ApprovalsListModel({
    required this.data,
  });
  late final List<Workflow> data;

  ApprovalsListModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Workflow.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final dataMap = <String, dynamic>{};
    dataMap['data'] = data.map((e) => e.toJson()).toList();
    return dataMap;
  }
}

class Workflow {
  Workflow({
    required this.referenceDoctype,
    required this.referenceName,
    required this.modifiedBy,
    required this.currentState,
    required this.roles,
    required this.fullName,
    required this.workflowTransition,
  });
  late final String referenceDoctype;
  late final String referenceName;
  late final String modifiedBy;
  late final String currentState;
  late final List<String> roles;
  late final String fullName;
  late final List<WorkflowTransition> workflowTransition;

  Workflow.fromJson(Map<String, dynamic> json) {
    referenceDoctype = json['reference_doctype'];
    referenceName = json['reference_name'];
    modifiedBy = json['modified_by'];
    currentState = json['current_state'];
    roles = List.castFrom<dynamic, String>(json['roles']);
    fullName = json['full_name'];
    workflowTransition = List.from(json['workflow_transition'])
        .map((e) => WorkflowTransition.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['reference_doctype'] = referenceDoctype;
    data['reference_name'] = referenceName;
    data['modified_by'] = modifiedBy;
    data['current_state'] = currentState;
    data['roles'] = roles;
    data['full_name'] = fullName;
    data['workflow_transition'] =
        workflowTransition.map((e) => e.toJson()).toList();
    return data;
  }
}

class WorkflowTransition {
  WorkflowTransition({
    required this.nextState,
    required this.action,
    required this.roleAllowed,
    required this.currentState,
  });
  late final String nextState;
  late final String action;
  late final String roleAllowed;
  late final String currentState;

  WorkflowTransition.fromJson(Map<String, dynamic> json) {
    nextState = json['next_state'];
    action = json['action'];
    roleAllowed = json['role_allowed'];
    currentState = json['current_state'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['next_state'] = nextState;
    data['action'] = action;
    data['role_allowed'] = roleAllowed;
    data['current_state'] = currentState;
    return data;
  }
}
