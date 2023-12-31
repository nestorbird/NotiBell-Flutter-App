import 'package:flutter/material.dart';
import 'package:notibell_mobile_app/services/api_services/workflow_service.dart';
import 'package:notibell_mobile_app/services/preference_service/storage_constants.dart';
import 'package:notibell_mobile_app/services/preference_service/storage_helper.dart';

import '../../approvals_list_screen/model/approvals_list_model.dart';

class ApprovalDetailsProvider extends ChangeNotifier {
  bool isTransitionsLoaded = false;
  bool isDocDetailsLoaded = false;
  bool isDocDetailsUpdated = false;
  bool isEntryDiscarded = false;
  List<dynamic> docTransitions = [];
  Map<String, dynamic> docDetails = {};
  Map<String, dynamic> updatedDocDetails = {};
  List<String> docActions = [];
  List<String> docStates = [];
  int status = 0;

  Future<void> getDocTransitions(String doctype, String currentStatus) async {
    isTransitionsLoaded = true;
    var response = await WorkflowService.getDocTransitions(doctype);
    if (response.status!) {
      isTransitionsLoaded = false;
      docTransitions = response.message;

      List<String> assignedRoles =
          await StorageHelper().getStringLists(StorageConstants.userRoles) ??
              [];

      if (assignedRoles.isNotEmpty) {
        docStates.clear();
        docActions.clear();
        for (var transition in docTransitions) {
          String state = transition["state"];
          String allowedRole = transition["allowed"];

          if (state == currentStatus && assignedRoles.contains(allowedRole)) {
            docStates.add(transition["next_state"]);
            docActions.add(transition["action"]);
          }
        }
      }
    } else {
      isTransitionsLoaded = false;
      docTransitions = [];
    }
    notifyListeners();
  }

  Future<void> getDocDetails(String doctype, String docId) async {
    isDocDetailsLoaded = true;
    var response = await WorkflowService.getDocDetails(doctype, docId);
    if (response.status!) {
      isDocDetailsLoaded = false;
      docDetails = response.message;
      //String currentStatus = docDetails["workflow_state"] ?? "";
      status = docDetails["docstatus"];
      //getDocTransitions(doctype, currentStatus);
    } else {
      isDocDetailsLoaded = false;
    }
    notifyListeners();
  }

  Future<void> updateDocDetails(
      String doctype, String docId, String action) async {
    isDocDetailsLoaded = true;
    var response =
        await WorkflowService.updateDocDetails(doctype, docId, action);
    if (response.status!) {
      isDocDetailsUpdated = true;
      docDetails = response.message;
      // String currentStatus = docDetails["workflow_state"];
      // getDocTransitions(doctype, currentStatus);
    } else {
      isDocDetailsLoaded = false;
    }
    notifyListeners();
  }

  Future<void> discardEntry(String docName) async {
    isEntryDiscarded = false;

    var response = await WorkflowService.discardWorkflowEntry(docName);
    if (response.status!) {
      isEntryDiscarded = true;
      docDetails = response.message;
    } else {
      isEntryDiscarded = false;
    }
    notifyListeners();
  }

  void getStatesAndActions(
      List<WorkflowTransition> workflowTransition, String currentState) async {
    docStates.clear();
    docActions.clear();
    List<String> assignedRoles =
        await StorageHelper().getStringLists(StorageConstants.userRoles) ?? [];

    for (var transition in workflowTransition) {
      if (transition.currentState == currentState &&
          assignedRoles.contains(transition.roleAllowed)) {
        docActions.add(transition.action);
        docStates.add(transition.nextState);
      }
    }

    notifyListeners();
  }
}
