import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:booking_transition_flutter/feature/controller.dart/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _fullnameEditingController = TextEditingController();
    final _phoneNumsEditingController = TextEditingController();
    final _usernameEditingController = TextEditingController();
    final _passwordEditingController = TextEditingController();
    final _verifyEditingController = TextEditingController();
    final _signUpController = SignUpController();
    //final _loginController = LoginController();

    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: AppColor.mainColor,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Sign up, now',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontFamily: 'Roboto bold'),
                          ),
                          const Text(
                            'Register with us, and unlock unlimited possibilities.',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image(
                          image: AssetImage(
                            'assets/images/sign_up_banner.jpg',
                          ),
                          width: 220,
                          height: 130,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _fullnameEditingController,
                        decoration: InputDecoration(
                          hintText: 'Enter your full name',
                          hintStyle: TextStyle(color: AppColor.mainColor),
                          //icon: const Icon(Icons.account_circle_outlined),
                          label: Text(
                            'Full name',
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // Change the default border color
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: AppColor.mainColor,
                                width: 2), // Change color and width
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _phoneNumsEditingController,
                        decoration: InputDecoration(
                          hintText: 'Enter your phone numbers',
                          hintStyle: TextStyle(color: AppColor.mainColor),
                          //icon: const Icon(Icons.account_circle_outlined),
                          label: Text(
                            'Phone numbers',
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // Change the default border color
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: AppColor.mainColor,
                                width: 2), // Change color and width
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _usernameEditingController,
                        decoration: InputDecoration(
                          hintText: 'Enter your username',
                          hintStyle: TextStyle(color: AppColor.mainColor),
                          //icon: const Icon(Icons.account_circle_outlined),
                          label: Text(
                            'Username',
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // Change the default border color
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: AppColor.mainColor,
                                width: 2), // Change color and width
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _passwordEditingController,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: AppColor.mainColor),
                          //icon: const Icon(Icons.account_circle_outlined),
                          label: Text(
                            'Password',
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // Change the default border color
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: AppColor.mainColor,
                                width: 2), // Change color and width
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _verifyEditingController,
                        decoration: InputDecoration(
                          hintText: 'Enter your password again',
                          hintStyle: TextStyle(color: AppColor.mainColor),
                          //icon: const Icon(Icons.account_circle_outlined),
                          label: Text(
                            'Verify password',
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // Change the default border color
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: AppColor.mainColor,
                                width: 2), // Change color and width
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.mainColor,
                                foregroundColor: Colors.white),
                            onPressed: () async {
                              String pass = _passwordEditingController.text;
                              String verifyPass = _verifyEditingController.text;

                              if (pass == verifyPass) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColor.mainColor,
                                        ),
                                      );
                                    });
                                await _signUpController.onRegister(
                                    _fullnameEditingController.text,
                                    _phoneNumsEditingController.text,
                                    _usernameEditingController.text.trim(),
                                    _passwordEditingController.text.trim());
                                Navigator.of(context).pop();
                              } else {
                                print('verify fail');
                              }
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
