import 'dart:core';

import 'package:flutter/material.dart';

class AccountInformation {
  late String fullName;
  late String gender;
  late String mail;
  late String phoneNumbers;
  late String avatarUrl;

  AccountInformation(
      {required this.fullName,
      required this.gender,
      required this.mail,
      required this.phoneNumbers,
      required this.avatarUrl});
}
