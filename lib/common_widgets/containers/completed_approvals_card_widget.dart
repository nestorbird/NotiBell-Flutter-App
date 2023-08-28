import 'package:flutter/material.dart';

import '../../screens/approvals_list_screen/model/approvals_list_model.dart';
import '../../utils/color_res/app_colors.dart';

class CompletedApprovalsCardWidget extends StatelessWidget {
  final String docId;
  final String status;
  final String doctype;
  final String modifiedBy;
  final Function onTap;
  final List<WorkflowTransition> workflowTransition;
  const CompletedApprovalsCardWidget(
      {super.key,
      required this.docId,
      required this.status,
      required this.doctype,
      required this.onTap,
      required this.modifiedBy,
      required this.workflowTransition});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: GestureDetector(
            onTap: () => onTap(),
            child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.greyColor, width: 0.3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(docId,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greyColor)),
                              Text(status,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blueThemeColor))
                            ],
                          ),
                          const SizedBox(height: 10),
                          // const Divider(thickness: 1),
                          // const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(doctype,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor)),
                              Text(modifiedBy,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blackColor)),
                            ],
                          ),
                          // const SizedBox(height: 10),
                          // const Divider(thickness: 1),
                          // const SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     ShortButtonWidget(
                          //         buttonText: workflowTransition.isNotEmpty
                          //             ? workflowTransition[0].action
                          //             : "",
                          //         onPressed: () {}),
                          //     ShortButtonWidget(
                          //         buttonText: workflowTransition.length > 2
                          //             ? workflowTransition[1].action
                          //             : "",
                          //         onPressed: () {})
                          //   ],
                          // )
                        ],
                      )),
                ))));
  }
}
