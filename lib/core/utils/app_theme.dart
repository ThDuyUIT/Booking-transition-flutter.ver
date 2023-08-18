import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
