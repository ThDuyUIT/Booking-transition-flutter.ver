import 'package:booking_transition_flutter/feature/presentation/page/Tickets/require_booking.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/require_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/utils/colors.dart';
import '../../../controller.dart/bookedticket_controller.dart';
import '../../../controller.dart/detailticket_controller.dart';
import 'detail_ticket.dart';
import 'list_item_ticket.dart';
import 'list_item_ticket_widget.dart';

class CancelTicket extends StatefulWidget {
  late bool isLogin;
  CancelTicket({super.key, required this.isLogin});

  //UpcomingTicket({super.key});

  @override
  State<StatefulWidget> createState() {
    return StateCancelTicket();
  }
}

class StateCancelTicket extends State<CancelTicket> {
  late bool stateLogin;
  List<ListItemTicket> cancleTickets = [];
  @override
  void initState() {
    super.initState();
    stateLogin = widget.isLogin;
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (stateLogin == true) {
  //     return Center(
  //         child: Padding(
  //       padding: const EdgeInsets.all(10),
  //       child: ListView.builder(
  //         itemCount: upcomingTickets.length,
  //         scrollDirection: Axis.vertical,
  //         itemBuilder: (context, index) {
  //           // ListItemTicket item = ListItemTicket(
  //           //     nameTicket: 'Giuong nam 40 cho co wc',
  //           //     departureDate: '4/8/2023',
  //           //     departureTime: '15:00PM',
  //           //     pricesTicket: '120000 VND',
  //           //     imageVehicle: 'assets/images/Xe_001.jpg',
  //           //     numberCar: '64F1-9019');

  //           ListItemTicket item = upcomingTickets[index];

  //           return ListItemTicketWidget(item: item);
  //         },
  //       ),
  //     ));
  //   } else {
  //     return RequireLogin();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    if (stateLogin == true) {
      final _bookedTicketController = Get.find<BookedTicketController>();
      return FutureBuilder(
        future: _bookedTicketController.setBookedTicket(2),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColor.mainColor,
            )); // Display a loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            cancleTickets = snapshot.data;

            return Center(
              child: Container(
                color: AppColor.mainColor,
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: cancleTickets.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    ListItemTicket item = cancleTickets[index];
                    return GestureDetector(
                        onTap: () async {
                          final _detailTicketController =
                              Get.find<DetailTicketController>();

                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColor.mainColor,
                                  ),
                                );
                              });

                          await _detailTicketController
                              .getInfoTicket(item.idTicket);
                          await _detailTicketController.getSeat(item.idTicket);

                          await _detailTicketController
                              .getInfoRoute(item.idRoute);
                          Navigator.of(context).pop();
                          Get.to(DetailTicket());
                        },
                        child: ListItemTicketWidget(item: item));
                  },
                ),
              ),
            );
          } else {
            return RequireBooking();
          }
        },
      );
    } else {
      return RequireLogin();
    }
  }
}
