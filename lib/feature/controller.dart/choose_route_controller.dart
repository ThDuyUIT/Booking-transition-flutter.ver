import 'package:booking_transition_flutter/feature/presentation/page/Tickets/list_item_ticket.dart';

class ChooseRouteController {
  late ListItemTicket item;

  void selectedRoute(ListItemTicket route) {
    item = route;
  }
}
