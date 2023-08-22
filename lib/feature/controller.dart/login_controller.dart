import 'package:booking_transition_flutter/core/component/drawer/header_drawer.dart';
import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Account/myaccount.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/choose_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/colors.dart';
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
      print(previousPage);

      if (previousPage == '/MyTicket') {
        Get.offAll(MyTicket());
        print('it work');
      } else {
        if ((previousPage == '/Search' && ChooseRoute.routes.isEmpty) ||
            previousPage == '/Login') {
          Get.offAll(MyAccount());
        } else {
          print('it not work');
          Get.back();
        }

        AppHeaderDrawer();
      }
    } catch (e) {
      print('failure');
    }
  }
}
