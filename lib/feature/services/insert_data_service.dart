import 'dart:io';

import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class InsertDataService {
  static Future<bool> insertAccountInformation(
      AccountInformation newAcc, String uid) async {
    try {
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('KHACHHANG');
      DatabaseReference uidRef = userRef.child('KH$uid');

      // Push the account information under the specified UID node.
      await uidRef.set({
        'anhDaiDien': newAcc.avatarUrl,
        'gioiTinh': newAcc.gender,
        'hoTen': newAcc.fullName,
        'sdt': newAcc.phoneNumbers,
        'tenTK': newAcc.mail,
      });

      // Return true to indicate success.
      return true;
    } catch (error) {
      // Return false if there's an error during the write operation.
      print('Error inserting account information: $error');
      return false;
    }
  }

  static Future updateAccountAvatart(File? image, String id) async {
    try {
      final ref = FirebaseStorage.instance.ref().child('Avata');

      final uploadTask =
          await ref.child('img$id').putFile(image!).whenComplete(() {});

      final urlDownload = await uploadTask.ref.getDownloadURL();
      return urlDownload;
    } catch (e) {
      print('fail upload');
    }
  }
}
