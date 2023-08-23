import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final String appBarTitleText;
  const AppbarWidget({super.key, required this.appBarTitleText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: const Icon(Icons.arrow_back),
            )),
        Text(appBarTitleText,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 45, width: 45)
      ],
    );
  }
}
