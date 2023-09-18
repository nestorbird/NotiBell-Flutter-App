// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../../screens/home_screen/model/create_checkin_request_model.dart';
import '../../screens/home_screen/provider/home_screen_provider.dart';
import '../../screens/sign_up_screen/model/face_regisreation_request_model.dart';
import '../../services/api_services/employee_service.dart';
import '../../services/api_utils/api_status.dart';
import '../../services/face_detection_service/camera.service.dart';
import '../../services/face_detection_service/ml_service.dart';
import '../../services/preference_service/storage_constants.dart';
import '../../services/preference_service/storage_helper.dart';
import '../../utils/db/databse_helper.dart';
import '../../utils/models/user.model.dart';
import '../snackbar/snackbar_widget.dart';

class AuthActionButton extends StatefulWidget {
  const AuthActionButton(
      {Key? key,
      required this.onPressed,
      required this.isLogin,
      required this.reload,
      required this.onFinish, required this.latitude, required this.longitude});
  final Function onPressed;
  final bool isLogin;
  final String latitude;
  final String longitude;
  final Function reload;
  final Function onFinish;
  @override
  _AuthActionButtonState createState() => _AuthActionButtonState();
}

class _AuthActionButtonState extends State<AuthActionButton> {
  final MLService _mlService = locator<MLService>();
  final CameraService _cameraService = locator<CameraService>();
  late HomeScreenProvider _homeScreenProvider;

  final TextEditingController _userTextEditingController =
      TextEditingController(text: '');
  final TextEditingController _passwordTextEditingController =
      TextEditingController(text: '');

  User? predictedUser;

  @override
  void initState() {
    _homeScreenProvider = Provider.of(context, listen: false);
    super.initState();
  }

  Future _signUp() async {
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    List<double> predictedData = List<double>.from(_mlService.predictedData);
    String user = _userTextEditingController.text;
    String password = _passwordTextEditingController.text;
    User userToSave = User(
      user: user,
      password: password,
      modelData: predictedData,
    );
    await databaseHelper.insert(userToSave);
    _mlService.setPredictedData([]);
    // Creating Request for the registration model
    FaceRegistrationRequestModel faceReqModel = FaceRegistrationRequestModel(
      customFaceRegistrationData: predictedData.toString(),
      userImageFile: _cameraService.imagePath,
    );

    var employeeId =
        await StorageHelper().getStringValues(StorageConstants.employeeId);

    await _homeScreenProvider.createFaceRegistration(
        faceReqModel, "Employee", employeeId!);
    if (_homeScreenProvider.faceApiResponse) {
      Navigator.pop(context);
      SnackbarWidget.showSnackBar(context, "Face registered successfully");
    }
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
  }

  Future _signIn() async {
    String password = _passwordTextEditingController.text;
    if (predictedUser!.password == password) {
      var employeeId =
          await StorageHelper().getStringValues(StorageConstants.employeeId);

      bool isUserCheckedIn =
          await StorageHelper().getBoolValues(StorageConstants.isUserCheckedIn);

      var response = await EmployeeService.createCheckin(
          CreateCheckInRequestModel(
              data: Data(
                  employee: employeeId,
                  logType: isUserCheckedIn ? "OUT" : "IN",
                  time: DateTime.now(),
                  customFaceStatus: 1,
                  customLatitude: widget.latitude,
                  customLongitude: widget.longitude,
                  customFaceRegistrationData:
                      predictedUser!.modelData.toString(),
                  userImageFile: "")));

      if (response.apiStatus == ApiStatus.REQUEST_SUCCESS) {
        if (isUserCheckedIn) {
          StorageHelper().setBoolValue(StorageConstants.isUserCheckedIn, false);
        } else {
          StorageHelper().setBoolValue(StorageConstants.isUserCheckedIn, true);
        }
      } else {}

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => Profile(
      //               this.predictedUser!.user,
      //               imagePath: _cameraService.imagePath!,
      //             )));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Wrong password!'),
          );
        },
      );
    }
  }

  Future<User?> _predictUser() async {
    User? userAndPass = await _mlService.predict();
    return userAndPass;
  }

  Future onTap() async {
    try {
      bool faceDetected = await widget.onPressed();
      if (faceDetected) {
        var user = await _predictUser();
        if (user != null) {
          predictedUser = user;
        }

        if (!widget.isLogin && predictedUser == null) {
          await _signUp();
        } else {
          await _signIn();
        }
        widget.onFinish();
        // PersistentBottomSheetController bottomSheetController =
        //     Scaffold.of(context)
        //         .showBottomSheet((context) => signSheet(context));
        // bottomSheetController.closed.whenComplete(() => widget.reload());
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[200],
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CAPTURE',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.camera_alt, color: Colors.white)
          ],
        ),
      ),
    );
  }

  signSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isLogin && predictedUser != null
              ? Container(
                  child: Text(
                    'Welcome back, ${predictedUser!.user}.',
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              : widget.isLogin
                  ? Container(
                      child: const Text(
                      'User not found 😞',
                      style: TextStyle(fontSize: 20),
                    ))
                  : Container(),
          // Container(
          //   child: Column(
          //     children: [
          //       !widget.isLogin
          //           ? AppTextField(
          //               controller: _userTextEditingController,
          //               labelText: "Your Name",
          //             )
          //           : Container(),
          //       SizedBox(height: 10),
          //       widget.isLogin && predictedUser == null
          //           ? Container()
          //           : AppTextField(
          //               controller: _passwordTextEditingController,
          //               labelText: "Password",
          //               isPassword: true,
          //             ),
          //       SizedBox(height: 10),
          //       Divider(),
          //       SizedBox(height: 10),
          //       widget.isLogin && predictedUser != null
          //           ? AppButton(
          //               text: 'LOGIN',
          //               onPressed: () async {
          //                 _signIn(context);
          //               },
          //               icon: Icon(
          //                 Icons.login,
          //                 color: Colors.white,
          //               ),
          //             )
          //           : !widget.isLogin
          //               ? AppButton(
          //                   text: 'SIGN UP',
          //                   onPressed: () async {
          //                     await _signUp(context);
          //                   },
          //                   icon: Icon(
          //                     Icons.person_add,
          //                     color: Colors.white,
          //                   ),
          //                 )
          //               : Container(),
          //     ],
          //   ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
