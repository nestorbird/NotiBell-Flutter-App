import 'package:apprize_mobile_app/common_widgets/appbar/appbar_widget.dart';
import 'package:apprize_mobile_app/screens/approval_details_screen/view/approval_details_screen.dart';
import 'package:apprize_mobile_app/screens/approvals_list_screen/provider/approval_list_provider.dart';
import 'package:apprize_mobile_app/utils/color_res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/containers/approvals_card_widget.dart';

class ApprovalsListScreen extends StatefulWidget {
  const ApprovalsListScreen({super.key});

  @override
  State<ApprovalsListScreen> createState() => _ApprovalsListScreenState();
}

class _ApprovalsListScreenState extends State<ApprovalsListScreen> {
  late ApprovalListProvider _approvalListProvider;

  @override
  void initState() {
    _approvalListProvider = Provider.of(context, listen: false);
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
                      visible: !value.isLoading,
                      child: Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
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
                                    ));
                              })))
                ],
              )),
        ),
      );
    });
  }
}
