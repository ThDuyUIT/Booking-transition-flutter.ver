class CityPoint {
  late String nameCity;
  late String urlImage;
  late String idCity;

  CityPoint(
      {required this.nameCity, required this.urlImage, required this.idCity});

  CityPoint.booking_action({required this.nameCity});

  CityPoint.non_para();
}
