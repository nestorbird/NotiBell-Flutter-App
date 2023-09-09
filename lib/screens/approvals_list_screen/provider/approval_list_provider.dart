import 'package:notibell_mobile_app/screens/approvals_list_screen/model/approvals_list_model.dart';
import 'package:notibell_mobile_app/services/api_services/workflow_service.dart';
import 'package:flutter/material.dart';

class ApprovalListProvider extends ChangeNotifier {
  bool isLoading = false;
  List<dynamic> workflows = [];
  List<Workflow> workflowList = [];

  Future<void> getWorkFlowList() async {
    isLoading = true;
    var response = await WorkflowService.getWorkflowEntries();

    if (response.status!) {
      workflows = response.message;
      isLoading = false;
    } else {
      workflows = [];
      isLoading = false;
    }
    notifyListeners();
  }

  Future<void> getWorkFlowListData() async {
    isLoading = true;

    var response = await WorkflowService.getWorkflowList();

    if (response.status!) {
      workflowList = response.message;
      isLoading = false;
    } else {
      workflowList = [];
      isLoading = false;
    }
    notifyListeners();
  }
}
