import 'package:flutter/material.dart';

import '../../utils/color_res/app_colors.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController textController;
  final TextInputType textInputType;
  final String labelText;
  final String hintText;
  const PasswordInputField(
      {super.key,
      required this.textController,
      required this.textInputType,
      required this.labelText,
      required this.hintText});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      keyboardType: widget.textInputType,
      cursorColor: AppColors.blackThemeColor,
      style: const TextStyle(fontSize: 14, color: Colors.black, height: 1),
      obscureText: _isPasswordVisible,
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 14, color: AppColors.blackThemeColor),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blackThemeColor),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: IconButton(
              color: AppColors.blackThemeColor,
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              icon: Icon(_isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined))),
    );
  }
}
