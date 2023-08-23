import 'package:apprize_mobile_app/services/api_services/workflow_service.dart';
import 'package:flutter/material.dart';

class CompletedApprovalsListProvider extends ChangeNotifier {
  bool isLoading = false;
  List<dynamic> workflows = [];

  Future<void> getWorkFlowList() async {
    isLoading = true;
    var response = await WorkflowService.getCompleteWorkflowEntries();

    if (response.status!) {
      workflows = response.message;
      isLoading = false;
    } else {
      workflows = [];
      isLoading = false;
    }
    notifyListeners();
  }
}
