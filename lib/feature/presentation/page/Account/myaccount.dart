import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Account/account_information_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/component/drawer/app_drawer.dart';
import '../../../../core/component/drawer/appbar.dart';

class MyAccount extends StatelessWidget {
  late bool isLogin = true;
  final accountController = Get.find<AccountController>();

  late AccountInformation account = AccountInformation(
      fullName: accountController.accountInformation!.fullName,
      gender: accountController.accountInformation!.gender,
      mail: accountController.accountInformation!.mail,
      phoneNumbers: accountController.accountInformation!.phoneNumbers,
      avatarUrl: accountController.accountInformation!.avatarUrl);

  //MyAccount({super.key, required this.account, required this.isLogin});

  //MyAccount({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return SafeArea(
        child: Scaffold(
          appBar: MyAppBar(),
          body: Center(
            child: AccountInformationWidget(
              account: account,
            ),
          ),
          drawer: AppDrawer(),
        ),
      );
    } else {
      return const Center(child: Text('required login'));
    }
  }
}
