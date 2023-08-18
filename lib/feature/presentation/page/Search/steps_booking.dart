import 'dart:ffi';

import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/choose_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/confirm_booking.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/find_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'choose_seat.dart';

class StepsBooking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateStepsBooking();
  }
}

class StateStepsBooking extends State<StepsBooking>
    with TickerProviderStateMixin {
  //static int currentStep = -1;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //currentStep = 0;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: AppColor.mainColor,
                child: IgnorePointer(
                  child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.route_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.event_seat_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.payment_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                        )
                      ]),
                ),
              ),
              Container(
                color: AppColor.mainColor,
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      ChooseRoute(
                        tabController: _tabController,
                      ),
                      ChooseSeat(
                        tabController: _tabController,
                      ),
                      ConfirmBooking(
                        tabController: _tabController,
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
