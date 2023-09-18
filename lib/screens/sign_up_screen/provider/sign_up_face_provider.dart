// import 'package:flutter/material.dart';
// import '../../../services/api_services/sign_up_face.dart';
// import '../model/face_regisreation_request_model.dart';

// class SignUpFaceProvider extends ChangeNotifier {
//   bool isLoading = false;
//   bool apiResp = false;

//   Future<void> createFaceRegistration(
//       FaceRegistrationRequestModel faceRegistrationReq,
//       String docType,
//       String docId) async {
//     isLoading = true;
//     var response = await FaceSignUpService()
//         .faceSignUp(faceRegistrationReq, docType, docId);

//     if (response.status!) {
//       apiResp = true;
//       isLoading = false;
//     } else {
//       apiResp = false;
//       isLoading = false;
//     }
//     notifyListeners();
//   }
// }
