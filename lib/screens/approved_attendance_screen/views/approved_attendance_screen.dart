import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notibell_mobile_app/utils/asset_res/asset_paths.dart';

class ApprovedAttendanceScreen extends StatelessWidget {
  const ApprovedAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetPaths.approvedTick,
            semanticsLabel: 'My SVG Image',
            height: 100,
            width: 60,
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            'Attendance Marked',
            style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('2nd August,2023')
        ],
      )),
    );
  }
}
