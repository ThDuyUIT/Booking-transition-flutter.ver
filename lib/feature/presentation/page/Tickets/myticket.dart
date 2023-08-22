import 'package:booking_transition_flutter/core/component/drawer/appbar.dart';
import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/cancel_tickets.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/completed_tickets.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/upcoming_tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//simport 'package:get/get.dart';

import '../../../../core/component/drawer/app_drawer.dart';
import '../../../../core/utils/colors.dart';

// ignore: must_be_immutable
class MyTicket extends StatefulWidget {
  MyTicket({
    super.key,
  });

  // MyTicket.logined(this.accountInformation, {super.key});

  @override
  State<StatefulWidget> createState() {
    return StateMyTicket();
  }
}

class StateMyTicket extends State<MyTicket> {
  final accountController = Get.find<AccountController>();
  int _currentIndex = 0;
  late bool isLogin;
  late List<Widget> typeOfTicket = [];

  @override
  Widget build(BuildContext context) {
    bool isLogin = false;

    if (accountController.accountInformation != null) {
      isLogin = true;
    }

    typeOfTicket = [
      UpcomingTicket(
        isLogin: isLogin,
      ),
      CompletedTicket(
        isLogin: isLogin,
      ),
      CancelTicket(
        isLogin: isLogin,
      )
    ];

    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        body:
            // Center(
            //   child: Text('Upcomming'),
            // ),
            typeOfTicket[_currentIndex],
        drawer: AppDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: AppColor.mainColor,
          selectedItemColor: AppColor.mainColor,
          items: const [
            BottomNavigationBarItem(
                label: 'UPCOMING',
                icon: Icon(
                  Icons.timer_outlined,
                )),
            BottomNavigationBarItem(
              label: 'COMPLETE',
              icon: Icon(Icons.check_circle_outline),
            ),
            BottomNavigationBarItem(
              label: 'CANCEL',
              icon: Icon(Icons.cancel_outlined),
            )
          ],
          //onTap: (index) => _currentIndex.value = index,
          //currentIndex: _currentIndex.value
          currentIndex: _currentIndex,
          onTap: (index) {
            //print(index);
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
