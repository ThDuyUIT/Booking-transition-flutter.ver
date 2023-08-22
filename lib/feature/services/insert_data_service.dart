import 'dart:io';

import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/choose_seat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/ticket.dart';

class InsertDataService {
  static Future<bool> insertAccountInformation(
      AccountInformation newAcc, String uid) async {
    try {
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('KHACHHANG');
      DatabaseReference uidRef = userRef.child('KH$uid');

      // Push the account information under the specified UID node.
      await uidRef.set({
        'anhDaiDien': newAcc.avatarUrl,
        'gioiTinh': newAcc.gender,
        'hoTen': newAcc.fullName,
        'sdt': newAcc.phoneNumbers,
        'tenTK': newAcc.mail,
      });

      // Return true to indicate success.
      return true;
    } catch (error) {
      // Return false if there's an error during the write operation.
      print('Error inserting account information: $error');
      return false;
    }
  }

  static Future updateAccountAvatart(File? image, String id) async {
    try {
      final ref = FirebaseStorage.instance.ref().child('Avata');

      final uploadTask =
          await ref.child('img$id').putFile(image!).whenComplete(() {});

      final urlDownload = await uploadTask.ref.getDownloadURL();
      return urlDownload;
    } catch (e) {
      print('fail upload');
    }
  }

  static Future insertNewTicket(Ticket ticket) async {
    DatabaseReference ticketRef = FirebaseDatabase.instance.ref().child('VE');

    String idTicket = 'VE${DateTime.now().microsecondsSinceEpoch}';

    DatabaseReference idTicketRef = ticketRef.child(idTicket);

    try {
      await idTicketRef.set({
        'idAccount': 'KH${ticket.idAccount}',
        'idTransition': ticket.idTransition,
        'priceTotal': ticket.pricesTotal,
        'methodPayment': ticket.methodPayment,
        'statusPayment': ticket.statusPayment,
        'statusTicket': ticket.statusTicket
      });
      return idTicket;
    } catch (e) {
      print('Booking fail');
    }
  }

  static Future inserDetailTicket(String idTicket) async {
    DatabaseReference detailRef = FirebaseDatabase.instance.ref().child('CTVE');
    late DatabaseReference idDetailRef;

    late String keyChild;
    StateChooseSeat.selectedSeats.forEach((element) async {
      keyChild = 'CT${DateTime.now().microsecondsSinceEpoch}';
      idDetailRef = detailRef.child(keyChild);

      try {
        await idDetailRef.set({'ticketId': idTicket, 'numberSeat': element});

        //return idDetailRef;
        print('Booking sucessful');
      } catch (e) {
        print('Booking fail');
        return;
      }
    });
  }
}
