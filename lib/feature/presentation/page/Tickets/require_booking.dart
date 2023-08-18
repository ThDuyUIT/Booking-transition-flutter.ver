import 'package:booking_transition_flutter/feature/presentation/page/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/utils/colors.dart';

class RequireBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.question_mark_rounded,
            color: AppColor.mainColor,
            size: 150,
          ),
          const Text(
            'Not find your booking history.',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          const Text(
            'Your booking history will be displayed here',
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
                  Get.to(Search());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mainColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Book now',
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
