import 'package:apprize_mobile_app/screens/completed_approvals_screen/view/completed_approvals_screen.dart';
import 'package:apprize_mobile_app/screens/home_screen/provider/home_screen_provider.dart';
import 'package:apprize_mobile_app/screens/login_screen/view/login_screen.dart';
import 'package:apprize_mobile_app/services/preference_service/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/containers/home_option_card_widget.dart';
import '../../../utils/asset_res/asset_paths.dart';
import '../../approvals_list_screen/view/approvals_list_scren.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenProvider _homeScreenProvider;
  String profileImageurl = "";

  @override
  void initState() {
    _homeScreenProvider = Provider.of(context, listen: false);
    _homeScreenProvider.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context, value, _) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetPaths.homeBackgroundImg),
                        fit: BoxFit.cover),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: _getNetworkImage(value.profileImageUrl!, ""),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                value.loggedInUserName!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ApprovalsListScreen()));
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25))),
                              child:
                                  SvgPicture.asset(AssetPaths.notificationIcon),
                            )),
                        const SizedBox(width: 10),
                        InkWell(
                            onTap: () {
                              StorageHelper().clearDetails();

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                  ((route) => false));
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25))),
                              child: const Icon(
                                Icons.logout_sharp,
                                color: Colors.white,
                              ),
                            ))
                      ]),
                    ],
                  )),
              Container(
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.only(top: 160),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      children: [
                        HomeOptionCard(
                          titleText: "Check In",
                          subTitleText: "04 Aug 2023",
                          onTap: () {},
                        ),
                        const SizedBox(height: 20),
                        HomeOptionCard(
                          titleText: "Approvals",
                          subTitleText: "See all pending approvals",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ApprovalsListScreen()));
                          },
                        ),
                        const SizedBox(height: 20),
                        HomeOptionCard(
                          titleText: "History",
                          subTitleText: "See all previous approvals",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CompletedApprovalsListScreen()));
                          },
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _getNetworkImage(String networkImageUrl, String defaultAssetUrl) {
    if (networkImageUrl.isNotEmpty) {
      return Image.network(networkImageUrl);
    } else {
      return Image.asset(defaultAssetUrl);
    }
  }
}
