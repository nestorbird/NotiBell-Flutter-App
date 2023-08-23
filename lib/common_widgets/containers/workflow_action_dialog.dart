import 'package:apprize_mobile_app/utils/color_res/app_colors.dart';
import 'package:flutter/material.dart';

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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)), //this right here
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Actions",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor),
                ),
                const SizedBox(height: 30),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.actions.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () => widget.onSelectedAction(
                              widget.actions[index], widget.docStates[index]),
                          child: Container(
                              height: 30,
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.3, color: AppColors.greyColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                widget.actions[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(color: AppColors.blackColor),
                              ))));
                    }),
              ],
            )));
  }
}
