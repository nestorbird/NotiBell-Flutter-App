import 'package:flutter/material.dart';

import '../../../services/preference_service/storage_constants.dart';
import '../../../services/preference_service/storage_helper.dart';

class HomeScreenProvider extends ChangeNotifier {
  String? loggedInUserName = "";
  String? loggedInUserEmail = "";
  String? profileImageUrl = "";

  getUserData() async {
    loggedInUserName =
        await StorageHelper().getStringValues(StorageConstants.fullName);
    profileImageUrl =
        await StorageHelper().getStringValues(StorageConstants.profilePic);
    loggedInUserEmail =
        await StorageHelper().getStringValues(StorageConstants.userId);
    notifyListeners();
  }
}
