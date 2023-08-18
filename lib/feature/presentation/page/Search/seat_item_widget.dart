import 'package:booking_transition_flutter/feature/presentation/page/Search/seat_item.dart';
import 'package:flutter/material.dart';

class SeatItemWidget extends StatelessWidget {
  late SeatItem item;
  SeatItemWidget({super.key, required this.item});

  @override
  Widget build(Object context) {
    return Icon(
      Icons.event_seat_rounded,
      size: 40,
      color: item.color,
    );
  }
}
