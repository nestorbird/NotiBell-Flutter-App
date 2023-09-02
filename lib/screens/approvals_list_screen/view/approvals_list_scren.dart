// ignore_for_file: use_build_context_synchronously

import 'package:apprize_mobile_app/common_widgets/appbar/appbar_widget.dart';
import 'package:apprize_mobile_app/screens/approval_details_screen/view/approval_details_screen.dart';
import 'package:apprize_mobile_app/screens/approvals_list_screen/provider/approval_list_provider.dart';
import 'package:apprize_mobile_app/utils/color_res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/containers/approvals_card_widget.dart';
import '../../../common_widgets/containers/workflow_action_dialog.dart';
import '../../../common_widgets/snackbar/snackbar_widget.dart';
import '../../approval_details_screen/provider/approval_details_provider.dart';
import '../model/approvals_list_model.dart';

class ApprovalsListScreen extends StatefulWidget {
  const ApprovalsListScreen({super.key});

  @override
  State<ApprovalsListScreen> createState() => _ApprovalsListScreenState();
}

class _ApprovalsListScreenState extends State<ApprovalsListScreen> {
  late ApprovalListProvider _approvalListProvider;
  late ApprovalDetailsProvider _approvalDetailsProvider;

  @override
  void initState() {
    _approvalListProvider = Provider.of(context, listen: false);
    _approvalDetailsProvider = Provider.of(context, listen: false);
    _approvalListProvider.getWorkFlowListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApprovalListProvider>(builder: (context, value, _) {
      return SafeArea(
        child: Scaffold(
          body: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppbarWidget(
                    appBarTitleText: "Approvals",
                  ),
                  const SizedBox(height: 40),
                  Visibility(
                      visible: !value.isLoading,
                      child: Text(
                          'Showing ${value.workflowList.length} Approvals',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.greyColor))),
                  const SizedBox(height: 30),
                  Visibility(
                      visible: value.workflowList.isEmpty,
                      child: const Center(
                        child: Text('No pending approvals'),
                      )),
                  Visibility(
                      visible: !value.isLoading,
                      child: Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: value.workflowList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: ApprovalsCardWidget(
                                      docId: value
                                          .workflowList[index].referenceName,
                                      doctype: value
                                          .workflowList[index].referenceDoctype,
                                      status: value
                                          .workflowList[index].currentState,
                                      modifiedBy:
                                          value.workflowList[index].fullName,
                                      workflowTransition:
                                          value.workflowList.isNotEmpty
                                              ? value.workflowList[index]
                                                  .workflowTransition
                                              : [],
                                      onTap: () async {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ApprovalDetailsScreen(
                                                      docName: value
                                                          .workflowList[index]
                                                          .name,
                                                      docType: value
                                                          .workflowList[index]
                                                          .referenceDoctype,
                                                      docTypeId: value
                                                          .workflowList[index]
                                                          .referenceName,
                                                      currentStatus: value
                                                          .workflowList[index]
                                                          .currentState,
                                                      workflowTransition: value
                                                              .workflowList
                                                              .isNotEmpty
                                                          ? value
                                                              .workflowList[
                                                                  index]
                                                              .workflowTransition
                                                          : [],
                                                    )));

                                        _approvalListProvider
                                            .getWorkFlowListData();
                                      },
                                      onActionTap: () =>
                                          _handleWorkflowActionPopup(
                                              value.workflowList[index]
                                                  .referenceDoctype,
                                              value.workflowList[index]
                                                  .referenceName,
                                              value.workflowList[index]
                                                  .workflowTransition,
                                              value.workflowList[index]
                                                  .currentState),
                                      onDiscardTap: () async {
                                        await _approvalDetailsProvider
                                            .discardEntry(
                                                value.workflowList[index].name);

                                        if (_approvalDetailsProvider
                                            .isEntryDiscarded) {
                                          await SnackbarWidget.showSnackBar(
                                              context,
                                              "Entry discarded successfully");
                                          value.getWorkFlowListData();
                                        }
                                      },
                                    ));
                              })))
                ],
              )),
        ),
      );
    });
  }

  _handleWorkflowActionPopup(String docType, String docTypeId,
      List<WorkflowTransition> workflowTransition, String currentState) async {
    _approvalDetailsProvider.getStatesAndActions(
        workflowTransition, currentState);
    await showDialog(
        context: context,
        builder: (BuildContext context) => WorkflowActionDialog(
            docStates: _approvalDetailsProvider.docStates,
            actions: _approvalDetailsProvider.docActions,
            onSelectedAction: (selectedAction, selectedState) async {
              await _approvalDetailsProvider.updateDocDetails(
                  docType, docTypeId, selectedState);

              if (_approvalDetailsProvider.isDocDetailsUpdated) {
                Navigator.pop(context);
                await SnackbarWidget.showSnackBar(
                    context, "Entry updated successfully");
                _approvalListProvider.getWorkFlowListData();
              }
            }));
  }
}
