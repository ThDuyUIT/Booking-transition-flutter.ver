import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/list_item_ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemTicketWidget extends StatelessWidget {
  final ListItemTicket item;

  const ListItemTicketWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        //color: Colors.white
      ),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ClipRRect(
                // borderRadius:
                //     const BorderRadius.horizontal(left: Radius.circular(10)),
                child: Image(
                    image:
                        //
                        ResizeImage(NetworkImage(item.imageVehicle),
                            width: 180, height: 300)),
              ),
            ),
            //),
          ),
          //),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Text(
                            item.nameTicket,
                            style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontFamily: 'Roboto bold'),
                            maxLines: 2, // Set the maximum number of lines
                            overflow:
                                TextOverflow.ellipsis, // Handle text overflow
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.directions_bus_rounded,
                          color: Color.fromARGB(255, 0, 66, 180),
                        ),
                        Text(
                          item.numberCar,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (Get.currentRoute == '/MyTicket')
                          const Icon(
                            Icons.date_range_rounded,
                            color: Colors.yellowAccent,
                          ),
                        if (Get.currentRoute == '/MyTicket')
                          Text(
                            item.departureDate,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white),
                          ),
                        if (Get.currentRoute == '/MyTicket')
                          const Text(
                            ' | ',
                            style: TextStyle(color: Colors.white),
                          ),
                        const Icon(
                          Icons.access_time_rounded,
                          color: Colors.redAccent,
                        ),
                        Text(
                          item.departureTime,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.money_rounded,
                          color: Colors.greenAccent,
                        ),
                        Text(
                          item.pricesTicket,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      //)
    );
  }
}

// class StateListItemWidget extend State<ListItemWidget>{
//   return
// }