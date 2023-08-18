import 'package:booking_transition_flutter/core/component/drawer/appbar.dart';
import 'package:booking_transition_flutter/feature/controller.dart/cities_controller.dart';
import 'package:booking_transition_flutter/feature/models/city_point.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/choose_city_point.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/choose_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/find_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/list_item_route.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/list_item_widget.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/steps_booking.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Tickets/list_item_ticket.dart';
import 'package:booking_transition_flutter/feature/services/get_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../core/component/drawer/app_drawer.dart';
import '../../../../core/utils/colors.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<StatefulWidget> createState() {
    return StateSearch();
  }
}

class StateSearch extends State<Search> {
  static CityPoint? startCity;
  static CityPoint? endCity;
  static String? departureDate;
  static int currentStep = -1;
  int typePoint = 0;
  String textTitle = 'Search your route';

  // Search.choosed_city(CityPoint choosedCity, int typePoint) {
  //   if (typePoint == 1) {
  //     this.startCity = choosedCity;
  //   } else {
  //     this.endCity = choosedCity;
  //   }
  // }

  static choosedCity(CityPoint choosedCity, int typePoint) {
    if (typePoint == 1) {
      startCity = choosedCity;
    } else {
      endCity = choosedCity;
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if ((startCity == null && endCity == null) || currentStep != -1) {
        if (currentStep == 0) {
          textTitle = 'Choose your routes';
        } else {
          if (currentStep == 1) {
            textTitle = 'Choose your seats';
          } else {
            if (currentStep == 2) {
              textTitle = 'Check out';
            } else {
              textTitle = 'Search your route';
            }
          }
        }
      }
    });

    StateFindRoute.startCity = startCity;
    StateFindRoute.endCity = endCity;
    departureDate = StateFindRoute.departureDate;
    void _showDatePicker() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2025));
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(),
        drawer: AppDrawer(),
        body: Container(
          //color: ,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 30),
                child:
                    (startCity == null && endCity == null) || currentStep != -1
                        ? Text(
                            textTitle,
                            // currentStep == 0
                            //     ? 'Choose your routes'
                            //     : currentStep == 1
                            //         ? 'Choose your seats'
                            //         : currentStep == 2
                            //             ? 'Check out'
                            //             : 'Search your route',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Roboto bold',
                                color: AppColor.mainColor),
                          ).animate().slideX(duration: 500.ms, begin: -5)
                        : Text(
                            textTitle,
                            // currentStep == 0
                            //     ? 'Choose your routes'
                            //     : currentStep == 1
                            //         ? 'Choose your seats'
                            //         : currentStep == 2
                            //             ? 'Check out'
                            //             : 'Search your route',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Roboto bold',
                                color: AppColor.mainColor),
                          ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text(
                  'Guarantee 150% refund if transport service is not provided',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(40))),
                      child: ChooseRoute.routes.length == 0
                          ? FindRoute()
                          : StepsBooking())

                  //ChooseRoute.not_exist())
                  // Column(
                  //     children: [
                  //       Positioned(
                  //         child: Card(
                  //           elevation: 7,
                  //           //shadowColor: Colors.grey,
                  //           color: Colors.white,
                  //           shape: RoundedRectangleBorder(
                  //             //side: const BorderSide(color: Colors.black),
                  //             borderRadius: BorderRadius.circular(10),
                  //           ),
                  //           child: Column(
                  //             mainAxisSize: MainAxisSize.max,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               GestureDetector(
                  //                 onTap: () async {
                  //                   // final _choosePointController =
                  //                   //     ChoosePointController();
                  //                   // await _choosePointController.LoadCities();

                  //                   final _citiesController =
                  //                       Get.find<CitiesController>();
                  //                   await _citiesController.setListCities();

                  //                   Get.to(ChooseCityPoint(
                  //                     typeOfPoint: 1,
                  //                   ));
                  //                 },
                  //                 child: Container(
                  //                   decoration: const BoxDecoration(
                  //                       color: Colors.white,
                  //                       borderRadius: BorderRadius.vertical(
                  //                           top: Radius.circular(10))),
                  //                   padding: const EdgeInsets.all(10),
                  //                   child: Row(
                  //                     children: [
                  //                       const Icon(
                  //                         Icons.radio_button_checked,
                  //                         size: 25,
                  //                         color: Colors.red,
                  //                       ),
                  //                       const SizedBox(
                  //                         width: 5,
                  //                       ),
                  //                       Text(
                  //                         startCity == null
                  //                             ? 'Start Point?'
                  //                             : startCity!.nameCity,
                  //                         style: TextStyle(
                  //                           color: startCity == null
                  //                               ? Colors.grey
                  //                               : Colors.black,
                  //                           fontSize: 20,
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               Container(
                  //                 width: double.infinity,
                  //                 height: 1,
                  //                 color: Colors.grey,
                  //               ),
                  //               GestureDetector(
                  //                 onTap: () async {
                  //                   final _citiesController =
                  //                       Get.find<CitiesController>();
                  //                   await _citiesController.setListCities();
                  //                   Get.to(ChooseCityPoint(typeOfPoint: 2));
                  //                 },
                  //                 child: Container(
                  //                   padding: EdgeInsets.all(10),
                  //                   decoration:
                  //                       const BoxDecoration(color: Colors.white),
                  //                   child: Row(
                  //                     children: [
                  //                       const Icon(
                  //                         Icons.radio_button_checked,
                  //                         size: 25,
                  //                         color: Colors.blue,
                  //                       ),
                  //                       const SizedBox(
                  //                         width: 5,
                  //                       ),
                  //                       Text(
                  //                         endCity == null
                  //                             ? 'Where to?'
                  //                             : endCity!.nameCity,
                  //                         style: TextStyle(
                  //                             color: endCity == null
                  //                                 ? Colors.grey
                  //                                 : Colors.black,
                  //                             fontSize: 20),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               Container(
                  //                 width: double.infinity,
                  //                 height: 1,
                  //                 color: Colors.grey,
                  //               ),
                  //               GestureDetector(
                  //                 onTap: () async {
                  //                   DateTime? foramtedDate;
                  //                   foramtedDate = await showDatePicker(
                  //                       context: context,
                  //                       initialDate: DateTime.now(),
                  //                       firstDate: DateTime.now(),
                  //                       lastDate: DateTime(2030));

                  //                   if (foramtedDate != null) {
                  //                     setState(() {
                  //                       departureDate =
                  //                           '${foramtedDate?.day}/${foramtedDate?.month}/${foramtedDate?.year}';
                  //                     });

                  //                     //print(departureDate);
                  //                   }
                  //                 },
                  //                 child: Container(
                  //                   padding: EdgeInsets.all(10),
                  //                   decoration: const BoxDecoration(
                  //                       color: Colors.white,
                  //                       borderRadius: BorderRadius.vertical(
                  //                           bottom: Radius.circular(10))),
                  //                   child: Row(
                  //                     children: [
                  //                       const Icon(
                  //                         Icons.date_range_rounded,
                  //                         color: Colors.blueAccent,
                  //                         size: 25,
                  //                       ),
                  //                       const SizedBox(
                  //                         width: 5,
                  //                       ),
                  //                       Text(
                  //                         departureDate ?? 'Departure Date?',
                  //                         style: TextStyle(
                  //                             color: departureDate == null
                  //                                 ? Colors.grey
                  //                                 : Colors.black,
                  //                             fontSize: 20),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       SizedBox(
                  //         width: double.infinity,
                  //         child: ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //                 backgroundColor: Colors.white),
                  //             onPressed: () async {
                  //               String failResult = '';
                  //               late var snackBar;
                  //               if (startCity == null) {
                  //                 failResult = 'Please choose a start point ?';
                  //                 snackBar = SnackBar(
                  //                     backgroundColor: AppColor.mainColor,
                  //                     content: Text(
                  //                       failResult,
                  //                       style: const TextStyle(
                  //                           color: Colors.white, fontSize: 18),
                  //                     ));
                  //                 ScaffoldMessenger.of(context)
                  //                     .showSnackBar(snackBar);
                  //                 return;
                  //               }

                  //               if (endCity == null) {
                  //                 failResult = 'Please choose an end point ?';
                  //                 snackBar = SnackBar(
                  //                     backgroundColor: AppColor.mainColor,
                  //                     content: Text(
                  //                       failResult,
                  //                       style: const TextStyle(
                  //                           color: Colors.white, fontSize: 18),
                  //                     ));
                  //                 ScaffoldMessenger.of(context)
                  //                     .showSnackBar(snackBar);
                  //                 return;
                  //               }

                  //               if (departureDate == null) {
                  //                 failResult = 'Please choose a departure date ?';
                  //                 snackBar = SnackBar(
                  //                     backgroundColor: AppColor.mainColor,
                  //                     content: Text(
                  //                       failResult,
                  //                       style: const TextStyle(
                  //                           color: Colors.white, fontSize: 18),
                  //                     ));
                  //                 ScaffoldMessenger.of(context)
                  //                     .showSnackBar(snackBar);
                  //                 return;
                  //               }

                  //               showDialog(
                  //                   context: context,
                  //                   builder: (context) {
                  //                     return Center(
                  //                       child: CircularProgressIndicator(
                  //                         color: AppColor.mainColor,
                  //                       ),
                  //                     );
                  //                   });
                  //               List<ListItemTicket> routes =
                  //                   await GetDataService.fetchRoutes();

                  //               Navigator.of(context).pop();

                  //               if (routes.isEmpty) {
                  //                 failResult = 'Not find available routes';
                  //                 snackBar = SnackBar(
                  //                     backgroundColor: AppColor.mainColor,
                  //                     content: Text(
                  //                       failResult,
                  //                       style: const TextStyle(
                  //                           color: Colors.white, fontSize: 18),
                  //                     ));
                  //                 ScaffoldMessenger.of(context)
                  //                     .showSnackBar(snackBar);
                  //               } else {
                  //                 Get.to(ChooseRoute(
                  //                   routes: routes,
                  //                 ));
                  //               }
                  //             },
                  //             child: Text(
                  //               'Search Tickets',
                  //               style: TextStyle(
                  //                   color: AppColor.mainColor, fontSize: 20),
                  //             )),
                  //       ),
                  //       const SizedBox(
                  //         height: 20,
                  //       ),
                  //       SizedBox(
                  //         width: double.infinity,
                  //         child: Text(
                  //           'Popular Routes: ',
                  //           textAlign: TextAlign.start,
                  //           style: TextStyle(fontSize: 20, color: Colors.white),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 220,
                  //         child: ListView.builder(
                  //           itemCount: 5,
                  //           scrollDirection: Axis.horizontal,
                  //           itemBuilder: (BuildContext context, int index) {
                  //             ListItemRoute item = ListItemRoute(
                  //                 startPoint: 'Tp Ho Chi Minh',
                  //                 endPoint: 'Vinh Long',
                  //                 prices: '120000',
                  //                 imageUrl: 'assets/images/vinhlong.jpg');
                  //             return ListItemWidget(item: item);
                  //           },
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  ),
            ],
          ),
        ),
        // )
      ),
    );
  }
}
