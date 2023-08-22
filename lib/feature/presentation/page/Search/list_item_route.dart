import 'package:booking_transition_flutter/feature/models/city_point.dart';
import 'package:flutter/material.dart';

class ListItemRoute {
  late String startPoint;
  late String endPoint;
  late String prices;
  late String imageUrl;
  late CityPoint startCity;
  late CityPoint endCity;

  ListItemRoute.non_para();

  ListItemRoute(
      {required this.startPoint,
      required this.endPoint,
      required this.prices,
      required this.imageUrl});
}
