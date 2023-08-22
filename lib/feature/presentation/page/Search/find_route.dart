import 'package:booking_transition_flutter/feature/controller.dart/feature_routes_controller.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/utils/colors.dart';
import '../../../controller.dart/cities_controller.dart';
import '../../../models/city_point.dart';
import '../../../services/get_data_service.dart';
import '../Tickets/list_item_ticket.dart';
import 'choose_city_point.dart';
import 'choose_route.dart';
import 'list_item_route.dart';
import 'list_item_widget.dart';

class FindRoute extends StatefulWidget {
  // late CityPoint startCity;
  // late CityPoint endCity;
  // static String? departureDate;

  // FindRoute.non_para({super.key});

  // FindRoute.selected_start({super.key, required this.startCity});

  // FindRoute.selected_end({super.key, required this.endCity});

  @override
  State<StatefulWidget> createState() {
    return StateFindRoute();
  }
}

class StateFindRoute extends State<FindRoute> {
  static CityPoint? startCity;
  static CityPoint? endCity;
  static String? departureDate;
  int typePoint = 0;
  final _featuredRouteController = Get.find<FeatureRouteController>();
  static List<ListItemRoute> routes = [];
  // static choosedCity(CityPoint choosedCity, int typePoint) {
  //   if (typePoint == 1) {
  //     startCity = choosedCity;
  //   } else {
  //     endCity = choosedCity;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    void _showDatePicker() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2025));
    }

    return Column(
      children: [
        Positioned(
          child: Card(
            elevation: 7,
            //shadowColor: Colors.grey,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              //side: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    // final _choosePointController =
                    //     ChoosePointController();
                    // await _choosePointController.LoadCities();

                    final _citiesController = Get.find<CitiesController>();

                    showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColor.mainColor,
                            ),
                          );
                        });

                    await _citiesController.setListCities();

                    Navigator.of(context).pop();

                    Get.to(ChooseCityPoint(
                      typeOfPoint: 1,
                    ));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10))),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.radio_button_checked,
                          size: 25,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          startCity == null
                              ? 'Start Point?'
                              : startCity!.nameCity,
                          style: TextStyle(
                            color:
                                startCity == null ? Colors.grey : Colors.black,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                GestureDetector(
                  onTap: () async {
                    final _citiesController = Get.find<CitiesController>();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColor.mainColor,
                            ),
                          );
                        });
                    await _citiesController.setListCities();
                    Navigator.of(context).pop();
                    Get.to(ChooseCityPoint(typeOfPoint: 2));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.radio_button_checked,
                          size: 25,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          endCity == null ? 'Where to?' : endCity!.nameCity,
                          style: TextStyle(
                              color:
                                  endCity == null ? Colors.grey : Colors.black,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                GestureDetector(
                  onTap: () async {
                    DateTime? foramtedDate;
                    foramtedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030));

                    if (foramtedDate != null) {
                      setState(() {
                        departureDate =
                            '${foramtedDate?.day}/${foramtedDate?.month}/${foramtedDate?.year}';
                      });

                      //print(departureDate);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(10))),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range_rounded,
                          color: Colors.blueAccent,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          departureDate ?? 'Departure Date?',
                          style: TextStyle(
                              color: departureDate == null
                                  ? Colors.grey
                                  : Colors.black,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () async {
                String failResult = '';
                late var snackBar;
                if (startCity == null) {
                  failResult = 'Please choose a start point ?';
                  snackBar = SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        failResult,
                        style:
                            TextStyle(color: AppColor.mainColor, fontSize: 18),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }

                if (endCity == null) {
                  failResult = 'Please choose an end point ?';
                  snackBar = SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        failResult,
                        style:
                            TextStyle(color: AppColor.mainColor, fontSize: 18),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }

                if (departureDate == null) {
                  failResult = 'Please choose a departure date ?';
                  snackBar = SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        failResult,
                        style:
                            TextStyle(color: AppColor.mainColor, fontSize: 18),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }

                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.mainColor,
                        ),
                      );
                    });
                List<ListItemTicket> routes =
                    await GetDataService.fetchRoutes();

                Navigator.of(context).pop();

                if (routes.isEmpty) {
                  failResult = 'Not find available routes';
                  snackBar = SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        failResult,
                        style:
                            TextStyle(color: AppColor.mainColor, fontSize: 18),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  //Get.to(
                  print('${routes.length} routes');
                  StateSearch.currentStep = 1;
                  ChooseRoute.routes = routes;
                  Get.offAll(Search());
                  //);
                }
              },
              child: Text(
                'Search Tickets',
                style: TextStyle(color: AppColor.mainColor, fontSize: 20),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Popular Routes: ',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontFamily: 'Roboto bold'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        routes.isNotEmpty
            ? SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: routes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            startCity = routes[index].startCity;
                            endCity = routes[index].endCity;
                          });
                        },
                        child: ListItemWidget(item: routes[index]));
                  },
                ))
            : SizedBox(
                height: 220,
                child: FutureBuilder(
                  future: _featuredRouteController.setFeaturedRoutes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error loading data');
                    } else if (!snapshot.hasData) {
                      return Text('No data available');
                    } else {
                      routes = snapshot.data;
                      return ListView.builder(
                        itemCount: routes.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () async {
                                setState(() {
                                  startCity = routes[index].startCity;
                                  endCity = routes[index].endCity;
                                });
                              },
                              child: ListItemWidget(item: routes[index]));
                        },
                      );
                    }
                  },
                ),
              )
      ],
    );
  }
}
