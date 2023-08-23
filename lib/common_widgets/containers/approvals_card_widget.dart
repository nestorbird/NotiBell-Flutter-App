import 'package:flutter/material.dart';

import '../../utils/color_res/app_colors.dart';

class ApprovalsCardWidget extends StatelessWidget {
  final String docId;
  final String status;
  final String doctype;
  final Function onTap;
  const ApprovalsCardWidget(
      {super.key,
      required this.docId,
      required this.status,
      required this.doctype,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
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
                          Text(doctype,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor)),
                        ],
                      )),
                ))));
  }
}
