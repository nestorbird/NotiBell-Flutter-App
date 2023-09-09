import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/asset_res/asset_paths.dart';

class HomeOptionCard extends StatelessWidget {
  final String titleText, subTitleText;
  final Function onTap;
  const HomeOptionCard(
      {super.key,
      required this.titleText,
      required this.subTitleText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: 100,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleText,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subTitleText,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      )
                    ],
                  )),
              Container(
                height: 45,
                width: 45,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: SvgPicture.asset(
                  AssetPaths.homeCardIcon,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ));
  }
}
