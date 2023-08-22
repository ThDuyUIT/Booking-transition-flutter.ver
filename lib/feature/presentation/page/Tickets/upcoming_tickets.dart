//import 'package:booking_transition_flutter/feature/presentation/page/Tickets/list_item_ticket.dart';
import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:booking_transition_flutter/feature/controller.dart/bookedticket_controller.dart';
import 'package:booking_transition_flutter/feature/controller.dart/choose_route_controller.dart';
import 'package:booking_transition_flutter/feature/controller.dart/detailticket_controller.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/detail_ticket.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/list_item_ticket_widget.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/require_booking.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/require_login.dart';
import 'package:booking_transition_flutter/feature/services/get_data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_item_ticket.dart';

class UpcomingTicket extends StatefulWidget {
  late bool isLogin;

  UpcomingTicket({super.key, required this.isLogin});

  //UpcomingTicket({super.key});

  @override
  State<StatefulWidget> createState() {
    return StateUpcomingTicket();
  }
}

class StateUpcomingTicket extends State<UpcomingTicket> {
  late bool stateLogin;
  List<ListItemTicket> upcomingTickets = [];

  // @override
  // void initState() {
  //   super.initState();
  //   stateLogin = widget.isLogin;
  //   //upcomingTickets = widget.tickets;
  // }

//   @override
//   Widget build(BuildContext context) {
//     if (stateLogin == true) {
//       final _bookedTicketController = Get.find<BookedTicketController>();
//       _bookedTicketController.setBookedTicket(0);
//       upcomingTickets = _bookedTicketController.bookedTicket;
//       return Center(
//           child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView.builder(
//           itemCount: upcomingTickets.length,
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             ListItemTicket item = upcomingTickets[index];

//             return ListItemTicketWidget(item: item);
//           },
//         ),
//       ));
//     } else {
//       return RequireLogin();
//     }
//   }

//   Future setListUpcomingTickets() async {
//     List<ListItemTicket> tickets = await GetDataService.fetchBookedTicket(0);
//     print(tickets.length);
//     return tickets;
//   }
// }

  var snackBar = SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        'Not found your ticket',
        style: TextStyle(color: AppColor.mainColor, fontSize: 18),
      ));

  @override
  Widget build(BuildContext context) {
    stateLogin = widget.isLogin;
    if (stateLogin == true) {
      final _bookedTicketController = Get.find<BookedTicketController>();
      return FutureBuilder(
        future: _bookedTicketController.setBookedTicket(0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColor.mainColor,
            )); // Display a loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            upcomingTickets = snapshot.data;

            // if (upcomingTickets.isEmpty) {
            //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // }

            return Center(
              child: Container(
                color: AppColor.mainColor,
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: upcomingTickets.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    ListItemTicket item = upcomingTickets[index];
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

  // Future setListUpcomingTickets() async {
  //   List<ListItemTicket> tickets = await GetDataService.fetchBookedTicket(0);
  //   print(tickets.length);
  //   return tickets;
  // }
}
