class Ticket {
  String? idTicket;
  String? idAccount;
  String? idTransition;
  String? pricesTotal;
  String? statusTicket;
  String? statusPayment;

  Ticket(
      {required this.idTicket,
      required this.idAccount,
      required this.idTransition,
      required this.pricesTotal,
      required this.statusTicket,
      required this.statusPayment});
}
