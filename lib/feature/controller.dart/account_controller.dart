import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../presentation/page/Tickets/myticket.dart';
import '../services/get_data_service.dart';

class AccountController {
  AccountInformation? accountInformation;
  String? uId;
  void setAccountInfo(AccountInformation acc) {
    accountInformation = acc;
  }

  void setUid(String id) {
    uId = id;
  }

  void resetAccountInfo() {
    accountInformation = null;
  }
}
