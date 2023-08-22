import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:booking_transition_flutter/feature/models/city_point.dart';
import 'package:booking_transition_flutter/feature/presentation/page/Search/search.dart';
import 'package:flutter/material.dart';

class ListItemCityWidget extends StatelessWidget {
  late CityPoint item;
  late int colorIcon;

  ListItemCityWidget({required this.item, required this.colorIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: item.idCity != StateSearch.startCity?.idCity &&
        //         item.idCity != StateSearch.endCity?.idCity
        //     ? Colors.white
        //     : Colors.grey.shade400,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        //borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.place,
                color: colorIcon == 1 ? Colors.red : Colors.blue,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                item.nameCity,
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 18,
                    fontFamily: 'Roboto bold'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
