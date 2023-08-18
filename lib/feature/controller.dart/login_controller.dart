import 'package:booking_transition_flutter/core/component/drawer/header_drawer.dart';
import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Account/myaccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../presentation/page/Tickets/myticket.dart';
import '../services/get_data_service.dart';

class LoginController {
  Future onLogin(String name, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: name, password: pass);
      //String userId = 'KH${userCredential.user!.uid}';
      String userId = userCredential.user!.uid;
      final accountoController = Get.find<AccountController>();

      final accountInformation =
          await GetDataService.fetchAccountInformation(userId);

      accountoController.setAccountInfo(accountInformation);
      accountoController.setUid(userId);

      String previousPage = Get.previousRoute;
      print(accountInformation.fullName);

      if (previousPage == '/MyTicket') {
        Get.offAll(MyTicket());
      } else {
        if (previousPage == '/MyAccount') {
          Get.offAll(MyAccount());
        } else {
          Get.back();
        }

        AppHeaderDrawer();
      }

      //Get.to(MyTicket());
      //Get.offAll(MyAccount());
      Get.back();
    } catch (e) {
      print('failure');
    }
  }
}
