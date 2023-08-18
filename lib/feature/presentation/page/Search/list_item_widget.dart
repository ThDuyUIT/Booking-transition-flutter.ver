import 'dart:io';

import 'package:booking_transition_flutter/feature/presentation/page/Search/list_item_route.dart';
import 'package:booking_transition_flutter/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final ListItemRoute item;

  const ListItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image(
                  image: ResizeImage(AssetImage(item.imageUrl),
                      height: 150, width: 300)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${item.startPoint} - ${item.endPoint}',
              style: TextStyle(
                  fontSize: 18,
                  color: AppColor.mainColor,
                  fontFamily: 'Playfair Display'),
            ),
            Text(
              '${item.prices} VND',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
