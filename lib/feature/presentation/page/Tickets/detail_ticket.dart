import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:booking_transition_flutter/feature/controller.dart/detailticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/utils/colors.dart';

class DetailTicket extends StatelessWidget {
  final _detailTicketController = Get.find<DetailTicketController>();
  final _accountController = Get.find<AccountController>();
  @override
  Widget build(Object context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.mainColor,
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detail your ticket',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Roboto bold',
                      color: Colors.white),
                ).animate().slideX(duration: 500.ms, begin: -5),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Here! You can see the details of your booked ticket.',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.white),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _detailTicketController.itemTicket.from,
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'Roboto bold'),
                              ),
                              Text(
                                'From',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Roboto bold',
                                    color: Colors.grey),
                              )
                            ],
                          )),
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
                                      _detailTicketController
                                          .itemTicket.numberCar,
                                      style: TextStyle(
                                          fontFamily: 'Roboto bold',
                                          fontSize: 19),
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
                                _detailTicketController.itemTicket.where,
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'Roboto bold'),
                              ),
                              Text(
                                'Where',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Roboto bold',
                                    color: Colors.grey),
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _detailTicketController.itemTicket.departureDate
                                    .substring(0, 4),
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
                                _detailTicketController
                                    .itemTicket.departureTime,
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
                                _detailTicketController.itemTicket.departureDate
                                    .substring(_detailTicketController
                                            .itemTicket.departureDate.length -
                                        4),
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
                      height: 30,
                      child: const Text(
                        '--------------------------------------------------------',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Roboto bold',
                            color: Colors.grey),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  _accountController
                                      .accountInformation!.fullName,
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
                                  _accountController
                                      .accountInformation!.phoneNumbers,
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
                              Text(_detailTicketController.seats.join(', '),
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
                                  _detailTicketController.ticket.pricesTotal
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
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Payment method',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Roboto bold',
                                  color: Colors.grey),
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _detailTicketController.ticket.methodPayment ==
                                        '1'
                                    ? Text(
                                        'VeMienTay',
                                        style: TextStyle(
                                            fontFamily: 'Roboto bold',
                                            fontSize: 20,
                                            color: AppColor.mainColor),
                                      )
                                    : Container(
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
                                      ),
                              ],
                            ))
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Ticket State',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Roboto bold',
                                  color: Colors.grey),
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  _detailTicketController.ticket.statusTicket ==
                                          '0'
                                      ? 'Upcomming'
                                      : _detailTicketController
                                                  .ticket.statusTicket ==
                                              '1'
                                          ? 'Complete'
                                          : 'Cancel',
                                  style: const TextStyle(
                                    fontFamily: 'Roboto bold',
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ))
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Payment State',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Roboto bold',
                                  color: Colors.grey),
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  _detailTicketController
                                              .ticket.statusPayment ==
                                          '0'
                                      ? 'Unpaid'
                                      : 'Paid',
                                  style: const TextStyle(
                                    fontFamily: 'Roboto bold',
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ))
                          ]),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
