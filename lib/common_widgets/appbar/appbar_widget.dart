import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final String appBarTitleText;
  final bool isOpenInBrowser;
  Function? onOpenInBrowser;
  AppbarWidget(
      {super.key,
      required this.appBarTitleText,
      required this.isOpenInBrowser,
      this.onOpenInBrowser});

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
        !isOpenInBrowser
            ? const SizedBox(height: 45, width: 45)
            : GestureDetector(
                onTap: () => onOpenInBrowser!(),
                child: Container(
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: const Icon(Icons.open_in_browser),
                )),
      ],
    );
  }
}
