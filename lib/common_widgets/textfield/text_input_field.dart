import 'package:apprize_mobile_app/utils/color_res/app_colors.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final TextEditingController textController;
  final TextInputType textInputType;
  final String labelText;
  final String hintText;
  const TextInputField(
      {super.key,
      required this.textController,
      required this.textInputType,
      required this.labelText,
      required this.hintText});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      keyboardType: widget.textInputType,
      cursorColor: AppColors.blackThemeColor,
      style: const TextStyle(fontSize: 14, color: Colors.black, height: 1),
      decoration: InputDecoration(
          labelText: widget.labelText,
          fillColor: AppColors.blackColor,
          focusColor: AppColors.blackColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blackThemeColor),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          labelStyle: TextStyle(fontSize: 14, color: AppColors.blackThemeColor),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
