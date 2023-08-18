import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:booking_transition_flutter/feature/controller.dart/choose_route_controller.dart';
import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:booking_transition_flutter/feature/models/city_point.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/find_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/list_item_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/search.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/seat_item.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/list_item_ticket.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// class GetDataService {
//   Future<AccountInformation> fetchAccountInformation(String id) async {
//     DatabaseReference userRef =
//         FirebaseDatabase.instance.ref().child('KHACHHANG').child(id);
//     late AccountInformation accountInformation;

//     userRef.once().then((DataSnapshot dataSnapshot) {
//       if (dataSnapshot.value != null) {
//         Map<dynamic, dynamic> userData = snapshot.value;

//         accountInformation = AccountInformation(
//             fullName: userData['hoTen'],
//             gender: userData['gioiTinh'],
//             mail: userData['tenTk'],
//             phoneNumbers: userData['sdt'],
//             avatarUrl: userData['anhDaiDien']);
//       }
//       return accountInformation;
//     });
//   }
// }

class GetDataService {
  static Future<AccountInformation> fetchAccountInformation(String id) async {
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref('KHACHHANG/KH$id');

    DatabaseEvent event = await userRef.once();

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> userData =
          event.snapshot.value as Map<dynamic, dynamic>;
      ;

      AccountInformation accountInformation = AccountInformation(
        fullName: userData['hoTen'],
        gender: userData['gioiTinh'],
        mail: userData['tenTK'],
        phoneNumbers: userData['sdt'],
        avatarUrl: userData['anhDaiDien'],
      );

      //print(accountInformation.mail);

      return accountInformation;
    } else {
      //return null;
      throw Exception('User data not found');
    }
  }

  static Future fetchCityPoints() async {
    try {
      final List<CityPoint> cities = [];
      DatabaseReference cityRef =
          FirebaseDatabase.instance.ref().child('DIADIEM');
      DatabaseEvent event = await cityRef.once();

      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> citiesData =
            event.snapshot.value as Map<dynamic, dynamic>;

        citiesData.forEach((key, value) {
          CityPoint city = CityPoint(
              idCity: key,
              nameCity: value['nameCity'],
              urlImage: value['anhdaidienDD']);
          cities.add(city);
        });

        return cities;
      }
    } catch (e) {
      print('fail fetch data DIADIEM');
    }
  }

  static Future fetchRoutes() async {
    List<ListItemTicket> routes = [];

    DatabaseReference routesRef =
        FirebaseDatabase.instance.ref().child('CHUYENXE');
    DatabaseEvent event = await routesRef.once();

    // if (event.snapshot.value != null) {
    //   Map<dynamic, dynamic> routesData =
    //       event.snapshot.value as Map<dynamic, dynamic>;

    //   routesData.forEach((keyRoute, valueRoute) async {
    //     print(valueRoute['busNumber']);
    //     if (StateSearch.startCity!.idCity == valueRoute['startPoint'] &&
    //         StateSearch.endCity!.idCity == valueRoute['endPoint'] &&
    //         StateSearch.departureDate == valueRoute['departureDate']) {
    //       DatabaseReference vehicleRef =
    //           FirebaseDatabase.instance.ref().child('XE');
    //       DatabaseEvent event = await vehicleRef.once();

    //       if (event.snapshot.value != null) {
    //         Map<dynamic, dynamic> vehicleData =
    //             event.snapshot.value as Map<dynamic, dynamic>;

    //         //print();
    //         vehicleData.forEach((keyVehicle, valueVehicle) {
    //           if (valueRoute['busNumber'] == keyVehicle) {
    //             ListItemTicket itemTicket = ListItemTicket(
    //                 nameTicket: valueVehicle['nameTicket'],
    //                 departureDate: valueRoute['departureDate'],
    //                 departureTime: valueRoute['departureTime'],
    //                 pricesTicket: valueRoute['priceTicket'],
    //                 imageVehicle: valueVehicle['anhdaidienXe'],
    //                 numberCar: keyVehicle);

    //             routes.add(itemTicket);
    //           }
    //         });
    //       }
    //     }
    //   });
    //   print(routes.length);
    //   return routes;
    // }

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> routesData =
          event.snapshot.value as Map<dynamic, dynamic>;

      for (var entry in routesData.entries) {
        var keyRoute = entry.key;
        var valueRoute = entry.value;

        if (StateFindRoute.startCity!.idCity == valueRoute['startPoint'] &&
            StateFindRoute.endCity!.idCity == valueRoute['endPoint'] &&
            StateFindRoute.departureDate == valueRoute['departureDate']) {
          DatabaseReference vehicleRef =
              FirebaseDatabase.instance.ref().child('XE');
          DatabaseEvent vehicleEvent = await vehicleRef.once();

          if (vehicleEvent.snapshot.value != null) {
            Map<dynamic, dynamic> vehicleData =
                vehicleEvent.snapshot.value as Map<dynamic, dynamic>;

            for (var vehicleEntry in vehicleData.entries) {
              var keyVehicle = vehicleEntry.key;
              var valueVehicle = vehicleEntry.value;

              if (valueRoute['busNumber'] == keyVehicle) {
                ListItemTicket itemTicket = ListItemTicket(
                  nameTicket: valueVehicle['nameTicket'],
                  departureDate: valueRoute['departureDate'],
                  departureTime: valueRoute['departureTime'],
                  pricesTicket: valueRoute['priceTicket'],
                  imageVehicle: valueVehicle['anhdaidienXe'],
                  numberCar: keyVehicle,
                  idRoute: keyRoute,
                );

                routes.add(itemTicket);
              }
            }
          }
        }
      }

      print(routes.length);
      return routes; // This line should be outside the for loop
    }
  }

  static Future fetchBookedTicket(int typeOfTicket) async {
    List<ListItemTicket> bookedTickets = [];
    final _accountController = Get.find<AccountController>();
    String formatedAccountID = 'KH${_accountController.uId}';
    //fetch data from VE branch
    DatabaseReference ticketRef = FirebaseDatabase.instance.ref().child('VE');
    DatabaseEvent event = await ticketRef.once();
    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> bookedTicketData =
          event.snapshot.value as Map<dynamic, dynamic>;

      for (var ticketEntry in bookedTicketData.entries) {
        var keyTicket = ticketEntry.key;
        var valueTicket = ticketEntry.value;

        //print(valueTicket['idAccount']);

        //combine with condition current id account and ticket status
        if (formatedAccountID == valueTicket['idAccount'] &&
            typeOfTicket.toString() == valueTicket['statusTicket']) {
          print(keyTicket);
          //fetch data from CHUYENXE branch
          DatabaseReference routeRef =
              FirebaseDatabase.instance.ref().child('CHUYENXE');
          DatabaseEvent routeEvent = await routeRef.once();

          if (routeEvent.snapshot.value != null) {
            Map<dynamic, dynamic> routeData =
                routeEvent.snapshot.value as Map<dynamic, dynamic>;

            for (var routeEntry in routeData.entries) {
              var keyRoute = routeEntry.key;
              var valueRoute = routeEntry.value;
              //combine with condition id transition
              if (keyRoute == valueTicket['idTransition']) {
                print(keyRoute);
                DatabaseReference vehicleRef =
                    FirebaseDatabase.instance.ref().child('XE');
                DatabaseEvent vehicleEvent = await vehicleRef.once();

                if (vehicleEvent.snapshot.value != null) {
                  Map<dynamic, dynamic> vehicleData =
                      vehicleEvent.snapshot.value as Map<dynamic, dynamic>;

                  for (var vehicleEntry in vehicleData.entries) {
                    var keyVehicle = vehicleEntry.key;
                    var valueVehicle = vehicleEntry.value;

                    if (keyVehicle == valueRoute['busNumber']) {
                      print(keyVehicle);
                      ListItemTicket item = ListItemTicket(
                          nameTicket: valueVehicle['nameTicket'],
                          departureDate: valueRoute['departureDate'],
                          departureTime: valueRoute['departureTime'],
                          pricesTicket: valueRoute['priceTicket'],
                          imageVehicle: valueVehicle['anhdaidienXe'],
                          numberCar: keyVehicle,
                          idRoute: keyRoute);

                      bookedTickets.add(item);
                    }
                  }
                }
              }
            }
          }
        }
      }
      return bookedTickets;
    }
  }

  static Future fetchBookedSeat() async {
    List<SeatItem> bookedSeat = [];
    final _chooseRouteController = Get.find<ChooseRouteController>();
    DatabaseReference routeRef =
        FirebaseDatabase.instance.ref().child('CHUYENXE');
    DatabaseEvent routeEvent = await routeRef.once();

    if (routeEvent.snapshot.value != null) {
      Map<dynamic, dynamic> routeData =
          routeEvent.snapshot.value as Map<dynamic, dynamic>;

      for (var routeEntry in routeData.entries) {
        var keyRoute = routeEntry.key;
        var valueRoute = routeEntry.value;

        if (_chooseRouteController.item.idRoute == keyRoute) {
          //print(keyRoute);
          DatabaseReference ticketRef =
              FirebaseDatabase.instance.ref().child('VE');
          DatabaseEvent ticketEvent = await ticketRef.once();

          if (ticketEvent.snapshot.value != null) {
            Map<dynamic, dynamic> ticketData =
                ticketEvent.snapshot.value as Map<dynamic, dynamic>;

            for (var ticketEntry in ticketData.entries) {
              var keyTicket = ticketEntry.key;
              var valueTicket = ticketEntry.value;

              if (valueTicket['idTransition'] == keyRoute) {
                DatabaseReference detailTicketRef =
                    FirebaseDatabase.instance.ref().child('CTVE');
                DatabaseEvent detailTikcketEvent = await detailTicketRef.once();

                if (detailTikcketEvent.snapshot.value != null) {
                  Map<dynamic, dynamic> detailTicketData = detailTikcketEvent
                      .snapshot.value as Map<dynamic, dynamic>;

                  for (var detailTicketEntry in detailTicketData.entries) {
                    var keyDetailTicket = detailTicketEntry.key;
                    var valueDetailTicket = detailTicketEntry.value;

                    if (valueDetailTicket['ticketId'] == keyTicket) {
                      print(valueDetailTicket['numberSeat']);
                      SeatItem item = SeatItem(
                          index: valueDetailTicket['numberSeat'].toString());
                      bookedSeat.add(item);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    //print(object)
    return bookedSeat;
  }
}
