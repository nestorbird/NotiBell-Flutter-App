import 'package:flutter/material.dart';

class PopupWidget {
  static displayPopup(
      {required BuildContext context, required Widget widget}) async {
    await showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Container();
      },
      transitionBuilder: (ctx, animationOne, animationTwo, child) {
        return Transform.scale(
          scale: Curves.easeInOut.transform(animationOne.value),
          child: widget,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
