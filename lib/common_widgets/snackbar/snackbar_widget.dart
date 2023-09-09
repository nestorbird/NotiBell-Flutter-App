import 'package:flutter/material.dart';

class SnackbarWidget {
  //Function to show the snackbar messages on UI.
  static showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      style: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white),
    ));
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar)
        .closed
        .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
  }
}
