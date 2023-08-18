import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:flutter/material.dart';

import 'header_drawer.dart';
import 'list_drawer.dart';

class AppDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [DrawerHeader(child: AppHeaderDrawer()), ListDrawer()],
      ),
    );
  }
}
