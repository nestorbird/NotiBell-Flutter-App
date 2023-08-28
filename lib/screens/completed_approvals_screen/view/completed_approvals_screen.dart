import 'package:apprize_mobile_app/common_widgets/appbar/appbar_widget.dart';
import 'package:apprize_mobile_app/screens/approval_details_screen/view/approval_details_screen.dart';
import 'package:apprize_mobile_app/screens/completed_approvals_screen/provider/completed_approvals_provider.dart';
import 'package:apprize_mobile_app/utils/color_res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/containers/completed_approvals_card_widget.dart';
import '../../approval_details_screen/view/completed_approval_screen.dart';

class CompletedApprovalsListScreen extends StatefulWidget {
  const CompletedApprovalsListScreen({super.key});

  @override
  State<CompletedApprovalsListScreen> createState() =>
      _CompletedApprovalsListScreenState();
}

class _CompletedApprovalsListScreenState
    extends State<CompletedApprovalsListScreen> {
  late CompletedApprovalsListProvider _approvalListProvider;

  @override
  void initState() {
    _approvalListProvider = Provider.of(context, listen: false);
    _approvalListProvider.getWorkFlowList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CompletedApprovalsListProvider>(
        builder: (context, value, _) {
      return SafeArea(
          child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppbarWidget(
                appBarTitleText: "History",
              ),
              const SizedBox(height: 40),
              Visibility(
                  visible: !value.isLoading,
                  child: Text(
                      'Showing ${value.workflows.length} completed approvals',
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
                          itemCount: value.workflows.length,
                          itemBuilder: (context, index) {
                            return CompletedApprovalsCardWidget(
                              docId: value.workflows[index]['name'],
                              doctype: value.workflows[index]
                                  ['reference_doctype'],
                              status: value.workflows[index]['status'],
                              modifiedBy: "",
                              workflowTransition: const [],
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CompletedApprovalDetailsScreen(
                                              docType: value.workflows[index]
                                                  ['reference_doctype'],
                                              docTypeId: value.workflows[index]
                                                  ['reference_name'],
                                              currentStatus: value
                                                  .workflows[index]['status'],
                                              workflowTransition: const [],
                                            )));
                              },
                            );
                          })))
            ],
          )),
        ),
      ));
    });
  }
}
