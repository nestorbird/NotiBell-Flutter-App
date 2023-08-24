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
  bool _selected = false;
  bool _selected2 = false;

  List<String> name = ['Home', 'Support'];

  @override
  void initState() {
    _homeScreenProvider = Provider.of(context, listen: false);
    _homeScreenProvider.getUserData();
    super.initState();
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context, value, _) {
      return SafeArea(
        child: Scaffold(
          key: _globalKey,
          drawer: _drawer,
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
                child: Container(
                  // color: Colors.blueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.white, width: 1.0)),
                        child: IconButton(
                            icon: Icon(
                              Icons.menu,
                              size: 28,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _globalKey.currentState!.openDrawer();
                            }),
                      ),
                      // Ink(
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.white, width: 10.0),
                      //     shape: BoxShape.circle,
                      //   ),
                      //   child: InkWell(
                      //     borderRadius: BorderRadius.circular(100.0),
                      //     onTap: () {
                      //       setState(() {
                      //         _globalKey.currentState!.openDrawer();
                      //       });
                      //     },
                      //     child: const Padding(
                      //       padding: EdgeInsets.all(10.0),
                      //       child: Icon(
                      //         Icons.menu,
                      //         size: 28.0,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 90,
                        width: 100,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Text 1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('Text 2',
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        // child: _getNetworkImage(value.profileImageUrl!, ""),
                      )
                    ],
                  ),
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

  Widget get _drawer {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          height: 210,
          width: MediaQuery.of(context).size.width * 0.84,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 33, 100, 243),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage(AssetPaths.homeBackgroundImg),
          //       fit: BoxFit.cover),
          // ),
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
                    child: const Column(
                      children: [
                        Text(
                          "Abc Mishra",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text("abc977@gmail.com")
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, bottom: 10),
                  child: const Text(
                    'MENU',
                    style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 14,
                        color: Color.fromARGB(255, 138, 137, 137)),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListView(
                    children: [
                      ListTile(
                        selected: _selected,
                        leading: const Icon(Icons.home),
                        minLeadingWidth: 0,
                        title: const Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          setState(() {
                            _selected = !_selected;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          });
                        },
                        iconColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> State) {
                          if (State.contains(MaterialState.selected)) {
                            return Colors.black;
                          } else {
                            return Colors.grey;
                          }
                        }),
                        textColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> State) {
                          if (State.contains(MaterialState.selected)) {
                            return Colors.black;
                          } else {
                            return Colors.grey;
                          }
                        }),
                      ),
                      ListTile(
                        leading: const Icon(Icons.headphones),
                        title: const Text(' Support',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        minLeadingWidth: 0,
                        onTap: () {
                          _selected2 = !_selected2;
                          Navigator.pop(context);
                        },
                        iconColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> State) {
                          if (State.contains(MaterialState.selected)) {
                            return Colors.black;
                          } else {
                            return Colors.grey;
                          }
                        }),
                        textColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> State) {
                          if (State.contains(MaterialState.selected)) {
                            return Colors.black;
                          } else {
                            return Colors.grey;
                          }
                        }),
                      ),
                    ],
                  ),
                )),
                const Divider(
                  color: Colors.grey,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset('lib/assets/images/logout.png')],
                    ),
                    // child: ListTile(
                    //   leading: const Icon(
                    //     Icons.logout,
                    //   ),
                    //   minLeadingWidth: 0,
                    //   title: const Text(
                    //     ' Logout ',
                    //     textAlign: TextAlign.center,
                    //   ),
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
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
    );
  }

  // Widget _getNetworkImage(String networkImageUrl, String defaultAssetUrl) {
  //   if (networkImageUrl.isNotEmpty) {
  //     return Image.network(networkImageUrl);
  //   } else {
  //     return Image.asset(defaultAssetUrl);
  //   }
  // }
}
