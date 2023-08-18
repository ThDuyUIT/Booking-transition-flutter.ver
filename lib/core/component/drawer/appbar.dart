import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title = 'VeMienTay';

  //const MyAppBar({required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        //color: Colors.white,
        margin: const EdgeInsets.only(right: 30),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.mainColor,
              fontFamily: 'Roboto bold',
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
