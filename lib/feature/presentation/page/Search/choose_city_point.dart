import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/find_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/list_item_city_widget.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller.dart/cities_controller.dart';
import '../../../models/city_point.dart';

class ChooseCityPoint extends StatefulWidget {
  late int typeOfPoint;
  ChooseCityPoint({super.key, required this.typeOfPoint});

  @override
  State<StatefulWidget> createState() {
    return StateChooseCityPoint();
  }
}

class StateChooseCityPoint extends State<ChooseCityPoint> {
  late List<CityPoint> cities = [];
  final _citiesController = Get.find<CitiesController>();

  @override
  Widget build(Object context) {
    cities = _citiesController.cities;
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColor.mainColor,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.radio_button_checked,
                      size: 25,
                      color: widget.typeOfPoint == 1 ? Colors.red : Colors.blue,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.typeOfPoint == 1 ? 'Start Point?' : 'Where to?',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListView.builder(
                      itemCount: cities.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        CityPoint item = cities[index];
                        return GestureDetector(
                          onTap: () {
                            // Get.offAll(
                            //     Search.choosedCity(item, widget.typeOfPoint));
                            // if (item.idCity != StateSearch.startCity?.idCity &&
                            //     item.idCity != StateSearch.endCity?.idCity) {
                            StateSearch.choosedCity(item, widget.typeOfPoint);
                            Get.offAll(Search());

                            //}
                          },
                          child: ListItemCityWidget(
                            item: item,
                            colorIcon: widget.typeOfPoint,
                          ),
                        );
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
