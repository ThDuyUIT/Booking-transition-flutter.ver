import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class AppHeaderDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateHeaderDrawer();
  }
}

class StateHeaderDrawer extends State<AppHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    late String? nameUser;
    final accountControler = Get.find<AccountController>();
    if (accountControler.accountInformation != null) {
      nameUser = accountControler.accountInformation!.fullName;
    } else {
      nameUser = '';
    }

    return Expanded(
      child: Container(
        width: double.infinity,
        height: 200,
        color: AppColor.mainColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   height: 70,
            //   decoration: const BoxDecoration(
            //       shape: BoxShape.circle,
            //       image: DecorationImage(
            //           image: AssetImage('assets/images/avatar.png'))),
            // ),
            CircleAvatar(
              maxRadius: 45,
              backgroundImage:
                  //accountControler.accountInformation!.avatarUrl == 'Unknow' ||
                  accountControler.accountInformation == null ||
                          accountControler.accountInformation?.avatarUrl ==
                              'Unknow'
                      ? const AssetImage('assets/images/avatar.png')
                          as ImageProvider
                      : NetworkImage(
                          accountControler.accountInformation!.avatarUrl),
            ),
            const SizedBox(height: 10),
            RichText(
                text: const TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 15)),
              TextSpan(
                  text: 'VeMienTay,',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontSize: 15)),
            ])),
            Text(
              nameUser,
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
