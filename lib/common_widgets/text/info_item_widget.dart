import 'package:notibell_mobile_app/utils/color_res/app_colors.dart';
import 'package:flutter/material.dart';

class InfoItemWidget extends StatelessWidget {
  final String titleTxt;
  final String contentTxt;
  final TextStyle titleStyle;
  final TextStyle contentStyle;

  const InfoItemWidget(
      {Key? key,
      required this.titleTxt,
      required this.contentTxt,
      this.titleStyle = const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
      this.contentStyle = const TextStyle(color: Colors.black)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleTxt,
          style: titleStyle,
          maxLines: 2,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: AppColors.greyColor),
              borderRadius: BorderRadius.circular(8)),
          child: Text(contentTxt, style: contentStyle),
        ),
      ],
    );
  }
}
