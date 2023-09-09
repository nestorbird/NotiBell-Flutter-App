import 'package:flutter/material.dart';
import 'package:notibell_mobile_app/utils/color_res/app_colors.dart';
import 'package:notibell_mobile_app/utils/string_res/app_strings.dart';

class SimplePopup extends StatefulWidget {
  final String message;
  final String buttonText;
  final Function onOkPressed;
  final bool hasCancelAction;
  const SimplePopup(
      {Key? key,
      required this.message,
      required this.buttonText,
      required this.onOkPressed,
      this.hasCancelAction = false})
      : super(key: key);
  @override
  State<SimplePopup> createState() => _SimplePopupState();
}

class _SimplePopupState extends State<SimplePopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: const EdgeInsets.all(20),
        child: Center(
            child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor),
              ),
              const SizedBox(height: 20),
              const Divider(),
              widget.hasCancelAction
                  ? SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () => widget.onOkPressed(),
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: Center(
                                      child: Text(
                                    widget.buttonText,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackColor),
                                  )))),
                          const VerticalDivider(
                            thickness: 1,
                          ),
                          InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: Center(
                                      child: Text(
                                    AppStrings.cancelTxt,
                                    style: const TextStyle(fontSize: 13),
                                  ))))
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () => widget.onOkPressed(),
                      child: SizedBox(
                          height: 20,
                          width: MediaQuery.of(context).size.width - 30,
                          child: Center(
                              child: Text(
                            widget.buttonText,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )))),
              const SizedBox(height: 10),
            ],
          ),
        )));
  }
}
