import 'package:apprize_mobile_app/screens/completed_approvals_screen/view/completed_approvals_screen.dart';
import 'package:apprize_mobile_app/screens/home_screen/provider/home_screen_provider.dart';
import 'package:apprize_mobile_app/screens/login_screen/view/login_screen.dart';
import 'package:apprize_mobile_app/screens/support_screen/support_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/containers/home_option_card_widget.dart';
import '../../../services/camera_service/camera_page.dart';
import '../../../services/preference_service/storage_helper.dart';
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

  List<String> texts = ['Home', 'Support'];
  final List<bool> _isSelected = [true, false];
  final List<Widget> _list = [const HomeScreen(), const SupportScreen()];
  List<String> images = [
    "lib/assets/images/home.png",
    "lib/assets/images/headphone.png"
  ];

  final cameras = availableCameras();
  @override
  void initState() {
    _homeScreenProvider = Provider.of(context, listen: false);
    _homeScreenProvider.getUserData();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context, value, _) {
      return SafeArea(
        child: Scaffold(
          key: _globalKey,
          drawer: _drawer(value),
          body: Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetPaths.homeBackgroundImg),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.0)),
                      child: IconButton(
                          icon: const Icon(
                            Icons.menu,
                            size: 28,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _globalKey.currentState!.openDrawer();
                          }),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 90,
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            value.loggedInUserName!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text('Attendance pending',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 28,
                      ),
                      // child: _getNetworkImage(value.profileImageUrl!, ""),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.only(top: 130),
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
                          onTap: () async {
                            await availableCameras().then((value) =>
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            CameraPage(cameras: value))));
                          },
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

  Widget _drawer(HomeScreenProvider value) {
    return Drawer(
        child: Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          height: 210,
          width: MediaQuery.of(context).size.width * 0.84,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 33, 100, 243),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.84,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 130),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            height: MediaQuery.of(context).size.height,

            // color: Colors.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        value.loggedInUserName!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(value.loggedInUserEmail!)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, bottom: 10),
                  child: const Text(
                    'MENU',
                    style: TextStyle(
                        letterSpacing: 5,
                        fontSize: 13,
                        color: Color.fromARGB(255, 138, 137, 137)),
                  ),
                ),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListView.builder(
                            itemCount: texts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.pop(context);
                                  }
                                  for (int i = 1; i < _isSelected.length; i++) {
                                    setState(() {
                                      if (index == i) {
                                        _isSelected[index] = true;
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    _list[index]),
                                          );
                                        });
                                      } else {
                                        _isSelected[i] = false;
                                      }
                                    });
                                  }
                                },
                                minLeadingWidth: 0,
                                leading: Image.asset(
                                  images[index],
                                  color: _isSelected[index]
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                                title: Text(
                                  texts[index],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: _isSelected[index]
                                          ? Colors.black
                                          : Colors.grey),
                                ),
                              );
                            }))),
                const Divider(
                  color: Colors.grey,
                ),

                //TODO:: Need to remove the image with text from here. There should be an icon only.
                GestureDetector(
                  onTap: () {
                    StorageHelper().clearDetails();

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        ((route) => false));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset(AssetPaths.logoutImg)],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Positioned(
          top: 50,
          left: 90,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 80,
            child: CircleAvatar(
              radius: 70,
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey,
              child: Icon(
                size: 70,
                Icons.person,
              ),
            ),
          ),
        )
      ],
    ));
  }

  // Widget _getNetworkImage(String networkImageUrl, String defaultAssetUrl) {
  //   if (networkImageUrl.isNotEmpty) {
  //     return Image.network(networkImageUrl);
  //   } else {
  //     return Image.asset(defaultAssetUrl);
  //   }
  // }
}
