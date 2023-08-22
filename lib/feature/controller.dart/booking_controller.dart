import 'package:booking_transition_flutter/feature/models/ticket.dart';
import 'package:booking_transition_flutter/feature/services/insert_data_service.dart';

class BookingController {
  //Ticket? ticket;

  Future onBooking(Ticket ticket) async {
    String idTicket = await InsertDataService.insertNewTicket(ticket);
    await InsertDataService.inserDetailTicket(idTicket);

    return idTicket;
  }
}
