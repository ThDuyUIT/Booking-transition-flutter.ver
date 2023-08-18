import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:booking_transition_flutter/feature/controller.dart/choose_route_controller.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Authentication/login.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/choose_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/list_16_seats.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/search.dart';
import 'package:booking_transition_flutter/feature/services/get_data_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'find_route.dart';

class ChooseSeat extends StatefulWidget {
  late TabController tabController;

  ChooseSeat({super.key, required this.tabController});

  @override
  State<StatefulWidget> createState() {
    return StateChooseSeat();
  }
}

class StateChooseSeat extends State<ChooseSeat> {
  final _chooseRouteController = Get.find<ChooseRouteController>();
  static List<String> selectedSeats = [];
  @override
  Widget build(context) {
    StateSearch.currentStep = 1;
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.place_rounded,
                            color: Colors.red,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'From: ${StateFindRoute.startCity?.nameCity}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.place_rounded,
                            color: Colors.red,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('To: ${StateFindRoute.endCity?.nameCity}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16))
                        ],
                      )
                    ],
                  )),
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    width: 2,
                    height: 80,
                    color: Colors.white,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.date_range_rounded,
                              color: Colors.yellow,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('Date: ${StateFindRoute.departureDate}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white))
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              size: 25,
                              color: Colors.pink,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Time: ${_chooseRouteController.item.departureTime}',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            const Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Icons.event_seat_rounded,
                        size: 30,
                        color: Colors.red,
                      ),
                      Text(
                        'Not available',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Icons.event_seat_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'Available',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Icons.event_seat_rounded,
                        size: 30,
                        color: Colors.greenAccent,
                      ),
                      Text(
                        'Selected',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            List16Seats(
              onSeatsSelected: (selectedIndex) {
                setState(() {
                  selectedSeats = selectedIndex;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              height: 110,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('Selected seats: ${selectedSeats.join(', ')}',
                        style: TextStyle(
                            fontFamily: 'Roboto bold',
                            color: AppColor.mainColor,
                            fontSize: 18)),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 1,
                            child: OutlinedButton.icon(
                                onPressed: () {
                                  selectedSeats.clear();
                                  widget.tabController.animateTo(0);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                  color: AppColor.mainColor,
                                ),
                                label: Text(
                                  'Back',
                                  style: TextStyle(
                                      fontSize: 18, color: AppColor.mainColor),
                                ))),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: selectedSeats.length != 0
                                ? ElevatedButton(
                                    onPressed: () {
                                      var snackBar = SnackBar(
                                          backgroundColor: AppColor.mainColor,
                                          content: const Text(
                                            'Please login to continue!',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ));

                                      final _accountController =
                                          Get.find<AccountController>();

                                      if (_accountController
                                              .accountInformation !=
                                          null) {
                                        widget.tabController.animateTo(2);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        Get.to(Login());
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.mainColor,
                                        foregroundColor: Colors.white),
                                    child: const Text(
                                      'Next step',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ))
                                : Container(
                                    color: Colors.white,
                                  ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
