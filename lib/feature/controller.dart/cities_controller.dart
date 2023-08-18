import 'package:booking_transition_flutter/feature/models/city_point.dart';
import 'package:booking_transition_flutter/feature/services/get_data_service.dart';

class CitiesController {
  late List<CityPoint> cities;

  // Future setListCities(List<CityPoint> list) async {
  //   cities = list;
  //   print(cities.length);
  // }

  Future setListCities() async {
    cities = await GetDataService.fetchCityPoints();
  }
}
