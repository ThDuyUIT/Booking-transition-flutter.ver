//import 'dart:html';

import 'dart:io';

import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Account/myaccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../services/insert_data_service.dart';

class UpdateAccountController {
  Future onUpdateAcc(AccountInformation updateAccount) async {
    final accountController = Get.find<AccountController>();

    //print(updateAccount.gender);
    String? uId = accountController.uId;
    final insertedInfo =
        await InsertDataService.insertAccountInformation(updateAccount, uId!);

    accountController.setAccountInfo(updateAccount);
    Get.offAll(MyAccount());
  }

  Future pickAvatar() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return pickedFile.path;
    }
  }

  Future onUploadAvatar(File? uploadAvatar) async {
    final accountController = Get.find<AccountController>();

    //print(updateAccount.gender);
    String? uId = accountController.uId;

    final urlDownload =
        await InsertDataService.updateAccountAvatart(uploadAvatar, uId!);
    //print(urlDownload);
    return urlDownload;
  }
}
