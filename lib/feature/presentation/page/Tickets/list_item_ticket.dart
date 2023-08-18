class ListItemTicket {
  late String nameTicket;
  late String nameRoute;
  late String departureDate;
  late String departureTime;
  late String pricesTicket;
  late String imageVehicle;
  late String numberCar;
  late String idRoute;

  ListItemTicket(
      {required this.nameTicket,
      required this.departureDate,
      required this.departureTime,
      required this.pricesTicket,
      required this.imageVehicle,
      required this.numberCar,
      required this.idRoute});
}
