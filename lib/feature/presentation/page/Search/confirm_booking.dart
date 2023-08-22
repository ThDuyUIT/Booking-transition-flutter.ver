import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:booking_transition_flutter/feature/controller.dart/booking_controller.dart';
import 'package:booking_transition_flutter/feature/models/ticket.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Account/myaccount.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/choose_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/choose_seat.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/find_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/search.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/myticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller.dart/choose_route_controller.dart';

class ConfirmBooking extends StatefulWidget {
  late TabController tabController;

  ConfirmBooking({super.key, required this.tabController});

  @override
  State<StatefulWidget> createState() {
    return StateConfirmBooking();
  }
}

class StateConfirmBooking extends State<ConfirmBooking> {
  final _chooseRouteController = Get.find<ChooseRouteController>();
  final _accountController = Get.find<AccountController>();
  int methodPayment = 1;

  Future createCupertinoDialog(
      Color colorTitle, String title, String content) async {
    return await showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
                fontFamily: 'Roboto bold', fontSize: 22, color: colorTitle),
          ),
          content: Text(
            content,
            style: TextStyle(
              fontFamily: 'Roboto bold',
              fontSize: 20,
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            CupertinoDialogAction(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Container(
          // padding: EdgeInsets.only(
          //   top: 40,
          //   left: 20,
          //   right: 20,
          // ),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 20,
                  right: 20,
                ),
                //decoration: ,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${StateFindRoute.startCity?.nameCity}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Roboto bold'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'From',
                            style: TextStyle(
                                fontFamily: 'Roboto bold',
                                fontSize: 20,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.place_rounded,
                                  color: Colors.redAccent,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.directions_bus_rounded,
                                  color: AppColor.mainColor,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.place_rounded,
                                  color: Colors.blueAccent,
                                  size: 30,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                              child: Text(
                                _chooseRouteController.item.numberCar,
                                style: TextStyle(
                                    fontFamily: 'Roboto bold', fontSize: 19),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${StateFindRoute.endCity?.nameCity}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Roboto bold'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Where',
                            style: TextStyle(
                                fontFamily: 'Roboto bold',
                                fontSize: 20,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${StateFindRoute.departureDate?.substring(0, 4)}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Roboto bold'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Date',
                          style: TextStyle(
                              fontFamily: 'Roboto bold',
                              fontSize: 20,
                              color: Colors.grey),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          _chooseRouteController.item.departureTime,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Roboto bold'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'TIME',
                          style: TextStyle(
                              fontFamily: 'Roboto bold',
                              fontSize: 20,
                              color: Colors.grey),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${StateFindRoute.departureDate?.substring(StateFindRoute.departureDate!.length - 4)}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Roboto bold'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Year',
                          style: TextStyle(
                              fontFamily: 'Roboto bold',
                              fontSize: 20,
                              color: Colors.grey),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 20,
                child: const Text(
                  '--------------------------------------------------------',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto bold',
                      color: Colors.grey),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_accountController.accountInformation!.fullName,
                            style: const TextStyle(
                              fontFamily: 'Roboto bold',
                              fontSize: 18,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Passenger',
                            style: TextStyle(
                                fontFamily: 'Roboto bold',
                                fontSize: 20,
                                color: Colors.grey))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            _accountController.accountInformation!.phoneNumbers,
                            style: const TextStyle(
                              fontFamily: 'Roboto bold',
                              fontSize: 18,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Phone nums',
                            style: TextStyle(
                                fontFamily: 'Roboto bold',
                                fontSize: 20,
                                color: Colors.grey))
                      ],
                    ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StateChooseSeat.selectedSeats.join(', '),
                            style: const TextStyle(
                              fontFamily: 'Roboto bold',
                              fontSize: 18,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Seats',
                            style: TextStyle(
                                fontFamily: 'Roboto bold',
                                fontSize: 20,
                                color: Colors.grey))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            (int.parse(_chooseRouteController
                                        .item.pricesTicket) *
                                    StateChooseSeat.selectedSeats.length)
                                .toString(),
                            style: const TextStyle(
                              fontFamily: 'Roboto bold',
                              fontSize: 18,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Prices(VND)',
                            style: TextStyle(
                                fontFamily: 'Roboto bold',
                                fontSize: 20,
                                color: Colors.grey))
                      ],
                    )),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 10, right: 10),
              //   //height: 20,
              //   child: const Text(
              //     '--------------------------------------------------------',
              //     style: TextStyle(
              //         fontSize: 20,
              //         fontFamily: 'Roboto bold',
              //         color: Colors.grey),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment',
                        style: TextStyle(
                            fontFamily: 'Roboto bold',
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio(
                                        activeColor: AppColor.mainColor,
                                        value: 1,
                                        groupValue: methodPayment,
                                        onChanged: (value) {
                                          setState(() {
                                            methodPayment = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'VeMienTay',
                                        style: TextStyle(
                                            fontFamily: 'Roboto bold',
                                            fontSize: 20,
                                            color: AppColor.mainColor),
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: AppColor.mainColor,
                                      value: 2,
                                      groupValue: methodPayment,
                                      onChanged: (value) {
                                        setState(() {
                                          methodPayment = value!;
                                        });
                                      },
                                    ),
                                    Container(
                                      child: Row(children: [
                                        Text(
                                          'Zalo',
                                          style: TextStyle(
                                              fontFamily: 'Roboto bold',
                                              fontSize: 20,
                                              color: AppColor.mainColor),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.green.shade400,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: const Text('Pay',
                                              style: TextStyle(
                                                  fontFamily: 'Roboto bold',
                                                  fontSize: 20,
                                                  color: Colors.white)),
                                        )
                                      ]),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: OutlinedButton.icon(
                            onPressed: () {
                              widget.tabController.animateTo(1);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 18,
                              color: AppColor.mainColor,
                            ),
                            label: Text(
                              'Back',
                              style: TextStyle(
                                  fontSize: 16, color: AppColor.mainColor),
                            ))),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () async {
                              bool shouldVerify = await createCupertinoDialog(
                                  AppColor.mainColor,
                                  'Confirm',
                                  'Confirm this booking?');

                              if (shouldVerify == true) {
                                String? idTicket;
                                final _chooseRouteController =
                                    Get.find<ChooseRouteController>();
                                String idTransition =
                                    'KH${_chooseRouteController.item.idRoute}';
                                String pricesTotal = (int.parse(
                                            _chooseRouteController
                                                .item.pricesTicket) *
                                        StateChooseSeat.selectedSeats.length)
                                    .toString();
                                Ticket ticket = Ticket(
                                    idAccount: _accountController.uId,
                                    idTransition:
                                        _chooseRouteController.item.idRoute,
                                    pricesTotal: pricesTotal,
                                    methodPayment: methodPayment.toString(),
                                    statusTicket: '0',
                                    statusPayment: '0');

                                final _bookingController = BookingController();

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColor.mainColor,
                                        ),
                                      );
                                    });

                                idTicket =
                                    await _bookingController.onBooking(ticket);
                                Navigator.of(context).pop();
                                String result = '';
                                late var snackBar;
                                if (idTicket != null) {
                                  result = 'Booking successfully!';
                                  snackBar = SnackBar(
                                      backgroundColor: Colors.white,
                                      content: Text(
                                        result,
                                        style: TextStyle(
                                            color: AppColor.mainColor,
                                            fontSize: 18),
                                      ));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  ChooseRoute.routes.clear();
                                  Get.offAll(MyTicket());
                                } else {
                                  result = 'Booking fail!';
                                  snackBar = SnackBar(
                                      backgroundColor: Colors.white,
                                      content: Text(
                                        result,
                                        style: TextStyle(
                                            color: AppColor.mainColor,
                                            fontSize: 18),
                                      ));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.greenAccent,
                                foregroundColor: Colors.white),
                            icon: const Icon(
                              Icons.check,
                              size: 18,
                            ),
                            label: const Text(
                              'Verify',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ))),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () async {
                              bool shouldVerify = await createCupertinoDialog(
                                  Colors.redAccent,
                                  'Cancel',
                                  'Cancel this booking?');
                              if (shouldVerify == true) {
                                StateChooseSeat.selectedSeats.clear();
                                ChooseRoute.routes.clear();
                                Get.offAll(Search());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Colors.white),
                            icon: const Icon(
                              Icons.close,
                              size: 18,
                            ),
                            label: const Text(
                              'Cancle',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ))),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
