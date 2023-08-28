import 'package:apprize_mobile_app/utils/color_res/app_colors.dart';
import 'package:flutter/material.dart';

class ShortButtonWidget extends StatefulWidget {
  final String buttonText;
  final Function onPressed;
  const ShortButtonWidget(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  State<ShortButtonWidget> createState() => _ShortButtonWidgetState();
}

class _ShortButtonWidgetState extends State<ShortButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 160,
        height: 30,
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
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )));
  }
}
