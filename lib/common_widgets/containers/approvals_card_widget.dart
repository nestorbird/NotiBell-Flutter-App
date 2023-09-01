import 'package:apprize_mobile_app/utils/string_res/app_strings.dart';
import 'package:flutter/material.dart';

import '../../screens/approvals_list_screen/model/approvals_list_model.dart';
import '../../utils/color_res/app_colors.dart';
import '../buttons/short_button_widget.dart';

class ApprovalsCardWidget extends StatelessWidget {
  final String docId;
  final String status;
  final String doctype;
  final String modifiedBy;
  final Function onTap;
  final Function onActionTap;
  final Function onDiscardTap;
  final List<WorkflowTransition> workflowTransition;
  const ApprovalsCardWidget(
      {super.key,
      required this.docId,
      required this.status,
      required this.doctype,
      required this.onTap,
      required this.modifiedBy,
      required this.workflowTransition,
      required this.onActionTap,
      required this.onDiscardTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 170,
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
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: AppColors.blueThemeColorOpacity,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Text(status,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blueThemeColor)))
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
                          //const SizedBox(height: 10),
                          const Divider(thickness: 1),
                          //const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ShortButtonWidget(
                                buttonText: AppStrings.discardTxt,
                                onPressed: () => onDiscardTap(),
                                buttonBgColor: AppColors.whiteColor,
                                borderColor: AppColors.blackThemeColor,
                                textColor: AppColors.blackColor,
                              ),
                              ShortButtonWidget(
                                buttonText: AppStrings.actionTxt,
                                onPressed: () => onActionTap(),
                                buttonBgColor: AppColors.blueThemeColor,
                                borderColor: AppColors.blueThemeColor,
                                textColor: AppColors.whiteColor,
                              ),
                            ],
                          )
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
