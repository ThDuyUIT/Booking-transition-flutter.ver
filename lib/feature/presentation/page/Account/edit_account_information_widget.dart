// import 'dart:html';
import 'dart:io';

import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:booking_transition_flutter/feature/controller.dart/account_controller.dart';
import 'package:booking_transition_flutter/feature/controller.dart/update_account_controller.dart';
import 'package:booking_transition_flutter/feature/models/account_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccountInformaion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateEditAccountInformaion();
  }
}

class StateEditAccountInformaion extends State<EditAccountInformaion> {
  int valueGender = 1;
  File? imageFile;

  final accountController = Get.find<AccountController>();

  // final AvatarController avatarController = AvatarController();
  final updateAccountController = UpdateAccountController();

  TextEditingController? _fullnameController;
  TextEditingController? _phonenumsController;
  TextEditingController? _mailController;

  @override
  void initState() {
    super.initState();
    initializeGender();
  }

  void initializeGender() {
    if (accountController.accountInformation?.gender == 'Male') {
      setState(() {
        valueGender = 1;
      });
    } else if (accountController.accountInformation?.gender == 'Female') {
      setState(() {
        valueGender = 2;
      });
    } else if (accountController.accountInformation?.gender == 'Others') {
      setState(() {
        valueGender = 3;
      });
    }

    _fullnameController = TextEditingController(
        text: accountController.accountInformation!.fullName);
    _phonenumsController = TextEditingController(
        text: accountController.accountInformation!.phoneNumbers);
    _mailController =
        TextEditingController(text: accountController.accountInformation!.mail);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.mainColor),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                //padding: EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () async {
                    String? pickedImagePath =
                        await UpdateAccountController().pickAvatar();
                    if (pickedImagePath != null) {
                      setState(() {
                        imageFile = File(pickedImagePath);
                      });
                    }
                  },
                  child: CircleAvatar(
                    backgroundImage:
                        accountController.accountInformation?.avatarUrl !=
                                    'Unknow' &&
                                imageFile == null
                            ? NetworkImage(
                                accountController.accountInformation!.avatarUrl)
                            : imageFile != null
                                ? FileImage(imageFile!)
                                : const AssetImage('assets/images/avatar.png')
                                    as ImageProvider,
                    maxRadius: 100,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 540,
                decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _fullnameController,
                        decoration: InputDecoration(
                          hintText: 'Edit your full name',
                          hintStyle: TextStyle(color: Colors.white),
                          //icon: const Icon(Icons.account_circle_outlined),
                          label: const Text(
                            'Full name',
                            style: TextStyle(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // Change the default border color
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2), // Change color and width
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _phonenumsController,
                        decoration: InputDecoration(
                          hintText: 'Edit your phone numbers',
                          hintStyle: const TextStyle(color: Colors.white),
                          //icon: const Icon(Icons.account_circle_outlined),
                          label: const Text(
                            'Phone numbers',
                            style: TextStyle(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // Change the default border color
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2), // Change color and width
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _mailController,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'Edit your phone numbers',
                          hintStyle: const TextStyle(color: Colors.white),
                          //icon: const Icon(Icons.account_circle_outlined),
                          label: const Text(
                            'Email',
                            style: TextStyle(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          disabledBorder: OutlineInputBorder(
                            // Change the default border color
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2), // Change color and width
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Genders:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Radio(
                                  activeColor:
                                      const Color.fromARGB(255, 0, 66, 180),
                                  value: 1,
                                  groupValue: valueGender,
                                  onChanged: (Value) {
                                    setState(() {
                                      valueGender = Value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Male',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              Radio(
                                  activeColor: Colors.redAccent,
                                  value: 2,
                                  groupValue: valueGender,
                                  onChanged: (Value) {
                                    setState(() {
                                      valueGender = Value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Female',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              Radio(
                                  activeColor: Colors.white,
                                  value: 3,
                                  groupValue: valueGender,
                                  onChanged: (Value) {
                                    setState(() {
                                      valueGender = Value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Others',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: AppColor.mainColor),
                            onPressed: () async {
                              if (_fullnameController!.text.isEmpty ||
                                  _phonenumsController!.text.isEmpty) {
                                print('Exist empty information field');
                              } else {
                                String linkAvatar = 'Unknow';

                                if (imageFile != null) {
                                  final linkUploadedAvatar =
                                      await updateAccountController
                                          .onUploadAvatar(imageFile);
                                  linkAvatar = linkUploadedAvatar;
                                } else {
                                  print('image file null');
                                }

                                String gender = setGenderValue();
                                AccountInformation updateAcc =
                                    AccountInformation(
                                        fullName: _fullnameController!.text,
                                        gender: gender,
                                        mail: _mailController!.text,
                                        phoneNumbers:
                                            _phonenumsController!.text,
                                        avatarUrl: linkAvatar);

                                updateAccountController.onUpdateAcc(updateAcc);
                              }
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 20),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  String setGenderValue() {
    late String gender;
    switch (valueGender) {
      case 1:
        gender = 'Male';
        break;
      case 2:
        gender = 'Female';
        break;
      case 3:
        gender = 'Others';
        break;
    }

    return gender;
  }
}
