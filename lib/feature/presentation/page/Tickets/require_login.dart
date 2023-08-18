import 'package:booking_transition_flutter/feature/presentation/page/Authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/colors.dart';

class RequireLogin extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.account_circle_rounded,
            color: AppColor.mainColor,
            size: 150,
          ),
          const Text(
            'Please login!',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          const Text(
            'Log in to see your booking history',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(Login());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mainColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Login now',
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
