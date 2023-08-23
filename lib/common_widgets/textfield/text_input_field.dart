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
      style: const TextStyle(fontSize: 15, color: Colors.black),
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(fontSize: 15),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
