class Ticket {
  String? idTicket;
  String? idAccount;
  String? idTransition;
  String? pricesTotal;
  String? statusTicket;
  String? statusPayment;
  String? methodPayment;

  Ticket(
      {required this.idAccount,
      required this.idTransition,
      required this.pricesTotal,
      required this.methodPayment,
      required this.statusTicket,
      required this.statusPayment});
}
