import 'package:flutter/material.dart';

class ShortButtonWidget extends StatefulWidget {
  final String buttonText;
  final Function onPressed;
  final Color buttonBgColor;
  final Color borderColor;
  final Color textColor;
  const ShortButtonWidget(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.buttonBgColor,
      required this.borderColor,
      required this.textColor});

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
                elevation: 0,
                backgroundColor: widget.buttonBgColor,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: widget.borderColor, width: 0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(10)))),
            child: Text(
              widget.buttonText,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: widget.textColor),
            )));
  }
}
