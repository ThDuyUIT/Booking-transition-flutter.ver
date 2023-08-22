import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Account/edit_account_information_widget.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/search.dart';
import 'package:booking_transition_flutter/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller.dart/account_controller.dart';

class AccountInformationWidget extends StatefulWidget {
  late AccountInformation account;

  AccountInformationWidget({super.key, required this.account});

  @override
  State<StatefulWidget> createState() {
    return StateAccountInformation();
  }
}

class StateAccountInformation extends State<AccountInformationWidget> {
  late AccountInformation acc;

  @override
  void initState() {
    super.initState();
    acc = widget.account;
  }

  @override
  Widget build(BuildContext context) {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: AppColor.mainColor,
    //         ),
    //       );
    //     });
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              backgroundImage: acc.avatarUrl == 'Unknow'
                  ? const AssetImage('assets/images/avatar.png')
                      as ImageProvider
                  : NetworkImage(acc.avatarUrl),
              maxRadius: 100,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                //height: 463,
                decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_circle,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Full name:',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                acc.fullName,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.transgender_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Gender:',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                acc.gender,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.mail_rounded,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Email:',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    acc.mail,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone_android_rounded,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Phone:',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(acc.phoneNumbers,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white))))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 50,
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          )),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.question_mark_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Help Center',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.arrow_right,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 50,
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          )),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_outline,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Share feedback',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.arrow_right,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black),
                          onPressed: () {
                            Get.to(EditAccountInformaion());
                          },
                          label: const Text(
                            'Edit',
                            style: TextStyle(fontSize: 20),
                          ),
                          icon: const Icon(
                            Icons.edit_note_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.redAccent),
                          onPressed: () async {
                            final FirebaseAuth _auth = FirebaseAuth.instance;

                            await _auth.signOut();
                            AccountController accountController =
                                Get.find<AccountController>();
                            accountController.resetAccountInfo();

                            Get.offAll(Search());
                          },
                          label: const Text(
                            'Sign out',
                            style: TextStyle(fontSize: 20),
                          ),
                          icon: const Icon(
                            Icons.logout,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
