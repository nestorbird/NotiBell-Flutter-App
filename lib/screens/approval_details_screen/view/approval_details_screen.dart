// ignore_for_file: use_build_context_synchronously

import 'package:apprize_mobile_app/common_widgets/buttons/long_button_widget.dart';
import 'package:apprize_mobile_app/common_widgets/containers/workflow_action_dialog.dart';
import 'package:apprize_mobile_app/screens/approval_details_screen/provider/approval_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/appbar/appbar_widget.dart';
import '../../../common_widgets/text/info_item_widget.dart';

class ApprovalDetailsScreen extends StatefulWidget {
  final String docType;
  final String docTypeId;
  final String currentStatus;
  const ApprovalDetailsScreen(
      {super.key,
      required this.docType,
      required this.docTypeId,
      required this.currentStatus});

  @override
  State<ApprovalDetailsScreen> createState() => _ApprovalDetailsScreenState();
}

class _ApprovalDetailsScreenState extends State<ApprovalDetailsScreen> {
  late ApprovalDetailsProvider _approvalDetailsProvider;

  @override
  void initState() {
    _approvalDetailsProvider = Provider.of(context, listen: false);
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
                      if (value.docDetails.values.elementAt(index) is List) {
                        return const SizedBox();
                      } else {
                        return InfoItemWidget(
                          titleTxt:
                              _getTitle(value.docDetails.keys.elementAt(index)),
                          contentTxt: (value.docDetails.keys.elementAt(index) ==
                                      "creation" ||
                                  value.docDetails.keys.elementAt(index) ==
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
        bottomNavigationBar: Container(
          height: value.isDocDetailsUpdated ? 60 : 0,
          padding: const EdgeInsets.all(10),
          child: LongButtonWidget(
              buttonText: "Take Action",
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => WorkflowActionDialog(
                        docStates: value.docStates,
                        actions: value.docActions,
                        onSelectedAction:
                            (selectedAction, selectedState) async {
                          await _approvalDetailsProvider.updateDocDetails(
                              widget.docType, widget.docTypeId, selectedState);

                          if (value.isDocDetailsUpdated) {
                            Navigator.pop(context);
                            _approvalDetailsProvider.getDocDetails(
                                widget.docType, widget.docTypeId);
                          }
                        }));
              }),
        ),
      ));
    });
  }

  String _getTitle(String titleTxt) {
    return titleTxt.replaceAll("_", " ").toUpperCase();
  }
}
