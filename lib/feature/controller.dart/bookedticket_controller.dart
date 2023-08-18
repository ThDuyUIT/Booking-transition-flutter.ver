import 'package:booking_transition_flutter/feature/presentation/page/Tickets/list_item_ticket.dart';
import 'package:booking_transition_flutter/feature/services/get_data_service.dart';

class BookedTicketController {
  Future setBookedTicket(int typeOfTicket) async {
    //bookedTicket = await GetDataService.fetchBookedTicket(typeOfTicket);
    return await GetDataService.fetchBookedTicket(typeOfTicket);
  }
}
