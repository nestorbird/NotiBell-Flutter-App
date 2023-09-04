import 'package:apprize_mobile_app/utils/color_res/app_colors.dart';
import 'package:apprize_mobile_app/utils/string_res/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/asset_res/asset_paths.dart';

class WorkflowActionDialog extends StatefulWidget {
  final List<String> actions;
  final List<String> docStates;
  final Function(String, String) onSelectedAction;

  const WorkflowActionDialog(
      {super.key,
      required this.actions,
      required this.onSelectedAction,
      required this.docStates});

  @override
  State<WorkflowActionDialog> createState() => _WorkflowActionDialogState();
}

class _WorkflowActionDialogState extends State<WorkflowActionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetAnimationCurve: Curves.bounceInOut,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)), //this right here
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // const SizedBox(
                //   height: 15,
                // ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                        child: Text(
                      AppStrings.actionsTxt,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor),
                    )),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              child: SvgPicture.asset(
                                AssetPaths.cancelIcon,
                                width: 15,
                                height: 15,
                                color: Colors.black,
                              ),
                              onTap: () => Navigator.pop(context),
                            ))),
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.actions.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () => widget.onSelectedAction(
                              widget.actions[index], widget.docStates[index]),
                          child: Container(
                              height: 30,
                              margin: const EdgeInsets.only(
                                  bottom: 15, left: 15, right: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.3,
                                      color: AppColors.blackThemeColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                widget.actions[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.bold),
                              ))));
                    }),
              ],
            )));
  }
}
