import 'package:booking_transition_flutter/feature/controller.dart/cities_controller.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/list_item_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/list_item_ticket.dart';
import 'package:booking_transition_flutter/feature/services/get_data_service.dart';
import 'package:get/get.dart';

import '../models/ticket.dart';

class DetailTicketController {
  late Ticket ticket;
  late List<String> seats;
  ListItemTicket itemTicket = ListItemTicket.non_para();
  //late ListItemRoute itemRoute;
  Future getInfoTicket(String idTicket) async {
    ticket = await GetDataService.fetchATicket(idTicket);

    print(ticket.idTransition);
  }

  Future getSeat(String idTicket) async {
    seats = await GetDataService.fetchSeats(idTicket);
    return seats;
  }

  Future getInfoRoute(String idRoute) async {
    itemTicket = await GetDataService.fetchInfoRoute(idRoute);
    final _citiesController = Get.find<CitiesController>();
    await _citiesController.setListCities();

    _citiesController.cities.forEach((element) {
      if (element.idCity == itemTicket.from) {
        itemTicket.from = element.nameCity;
      } else {
        if (element.idCity == itemTicket.where) {
          itemTicket.where = element.nameCity;
        }
      }
    });

    print(itemTicket.from);
  }
}
