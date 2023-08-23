import 'package:flutter/material.dart';

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
      style: const TextStyle(fontSize: 15, color: Colors.black),
      obscureText: _isPasswordVisible,
      decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: IconButton(
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
