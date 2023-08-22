import 'package:booking_transition_flutter/feature/models/city_point.dart';

class ListItemTicket {
  late String nameTicket;
  late String from;
  late String where;
  late String departureDate;
  late String departureTime;
  late String pricesTicket;
  late String imageVehicle;
  late String numberCar;
  late String idRoute;
  late String idTicket;
  late int capacity;

  ListItemTicket.non_para();

  ListItemTicket(
      {required this.nameTicket,
      required this.departureDate,
      required this.departureTime,
      required this.pricesTicket,
      required this.imageVehicle,
      required this.numberCar,
      required this.idRoute,
      required this.capacity});
}
