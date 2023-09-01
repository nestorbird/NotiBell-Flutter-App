// ignore_for_file: use_build_context_synchronously

import 'package:apprize_mobile_app/screens/approval_details_screen/provider/approval_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/appbar/appbar_widget.dart';
import '../../../common_widgets/buttons/short_button_widget.dart';
import '../../../common_widgets/containers/workflow_action_dialog.dart';
import '../../../common_widgets/text/info_item_widget.dart';
import '../../../utils/color_res/app_colors.dart';
import '../../../utils/string_res/app_strings.dart';
import '../../approvals_list_screen/model/approvals_list_model.dart';

class ApprovalDetailsScreen extends StatefulWidget {
  final String docType;
  final String docTypeId;
  final String currentStatus;
  final String docName;
  final List<WorkflowTransition> workflowTransition;
  const ApprovalDetailsScreen(
      {super.key,
      required this.docType,
      required this.docTypeId,
      required this.currentStatus,
      required this.workflowTransition,
      required this.docName});

  @override
  State<ApprovalDetailsScreen> createState() => _ApprovalDetailsScreenState();
}

class _ApprovalDetailsScreenState extends State<ApprovalDetailsScreen> {
  late ApprovalDetailsProvider _approvalDetailsProvider;

  @override
  void initState() {
    _approvalDetailsProvider = Provider.of(context, listen: false);
    _approvalDetailsProvider.getStatesAndActions(
        widget.workflowTransition, widget.currentStatus);
    _approvalDetailsProvider.getDocDetails(widget.docType, widget.docTypeId);
    // _approvalDetailsProvider.getDocTransitions(widget.docType, widget.currentStatus);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApprovalDetailsProvider>(builder: (context, value, _) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                margin: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppbarWidget(
                          appBarTitleText: "Approval Detail",
                        ),
                        const SizedBox(height: 40),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: value.docDetails.keys.length,
                          itemBuilder: (context, index) {
                            if (value.docDetails.values.elementAt(index)
                                is List) {
                              return const SizedBox();
                            } else {
                              return InfoItemWidget(
                                titleTxt: _getTitle(
                                    value.docDetails.keys.elementAt(index)),
                                contentTxt:
                                    (value.docDetails.keys.elementAt(index) ==
                                                "creation" ||
                                            value.docDetails.keys
                                                    .elementAt(index) ==
                                                "modified")
                                        ? DateFormat("yyyy-MM-dd hh:mm:ss")
                                            .parse(value.docDetails.values
                                                .elementAt(index)
                                                .toString())
                                            .toString()
                                        : value.docDetails.values
                                            .elementAt(index)
                                            .toString(),
                              );
                            }
                          },
                        )
                      ],
                    )),
              ),
              bottomNavigationBar: Card(
                  elevation: 5,
                  // child: Container(
                  //   height: !value.isDocDetailsUpdated ? 60 : 0,
                  //   padding: const EdgeInsets.all(10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       ShortButtonWidget(
                  //           buttonText: widget.workflowTransition.isNotEmpty
                  //               ? widget.workflowTransition[0].action
                  //               : "",
                  //           onPressed: () async {
                  //             await _approvalDetailsProvider.updateDocDetails(
                  //                 widget.docType,
                  //                 widget.docTypeId,
                  //                 widget.workflowTransition[0].nextState);

                  //             if (value.isDocDetailsUpdated) {
                  //               Navigator.pop(context);
                  //               _approvalDetailsProvider.getDocDetails(
                  //                   widget.docType, widget.docTypeId);
                  //             }
                  //           }),
                  //       ShortButtonWidget(
                  //           buttonText: widget.workflowTransition.length > 1
                  //               ? widget.workflowTransition[1].action
                  //               : "",
                  //           onPressed: () async {
                  //             await _approvalDetailsProvider.updateDocDetails(
                  //                 widget.docType,
                  //                 widget.docTypeId,
                  //                 widget.workflowTransition[1].nextState);

                  //             if (value.isDocDetailsUpdated) {
                  //               Navigator.pop(context);
                  //               _approvalDetailsProvider.getDocDetails(
                  //                   widget.docType, widget.docTypeId);
                  //             }
                  //           })
                  //     ],
                  //   ),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ShortButtonWidget(
                          buttonText: AppStrings.discardTxt,
                          onPressed: () async {
                            await _approvalDetailsProvider
                                .discardEntry(widget.docName);
                          },
                          buttonBgColor: AppColors.whiteColor,
                          borderColor: AppColors.blackThemeColor,
                          textColor: AppColors.blackColor,
                        ),
                        ShortButtonWidget(
                          buttonText: AppStrings.actionTxt,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    WorkflowActionDialog(
                                        docStates: value.docStates,
                                        actions: value.docActions,
                                        onSelectedAction: (selectedAction,
                                            selectedState) async {
                                          await _approvalDetailsProvider
                                              .updateDocDetails(
                                                  widget.docType,
                                                  widget.docTypeId,
                                                  selectedState);

                                          if (value.isDocDetailsUpdated) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                        }));
                          },
                          buttonBgColor: AppColors.blueThemeColor,
                          borderColor: AppColors.blueThemeColor,
                          textColor: AppColors.whiteColor,
                        ),
                      ],
                    ),
                    // child: LongButtonWidget(
                    //     buttonText: "Action",
                    //     onPressed: () {
                    //       showDialog(
                    //           context: context,
                    //           builder: (BuildContext context) =>
                    //               WorkflowActionDialog(
                    //                   docStates: value.docStates,
                    //                   actions: value.docActions,
                    //                   onSelectedAction: (selectedAction,
                    //                       selectedState) async {
                    //                     await _approvalDetailsProvider
                    //                         .updateDocDetails(
                    //                             widget.docType,
                    //                             widget.docTypeId,
                    //                             selectedState);

                    //                     if (value.isDocDetailsUpdated) {
                    //                       Navigator.pop(context);
                    //                       _approvalDetailsProvider
                    //                           .getDocDetails(widget.docType,
                    //                               widget.docTypeId);
                    //                     }
                    //                   }));
                    //     })),
                  ))));
    });
  }

  String _getTitle(String titleTxt) {
    return titleTxt.replaceAll("_", " ").toUpperCase();
  }
}
