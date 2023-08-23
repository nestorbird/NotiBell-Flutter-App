import 'package:apprize_mobile_app/utils/color_res/app_colors.dart';
import 'package:flutter/material.dart';

class LongButtonWidget extends StatefulWidget {
  final String buttonText;
  final Function onPressed;
  const LongButtonWidget(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  State<LongButtonWidget> createState() => _LongButtonWidgetState();
}

class _LongButtonWidgetState extends State<LongButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
            onPressed: () => widget.onPressed(),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueThemeColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(15),
                        right: Radius.circular(15)))),
            child: Text(
              widget.buttonText,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )));
  }
}
