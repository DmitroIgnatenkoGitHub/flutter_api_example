import 'package:flutter/material.dart';
import 'package:flutter_api_example/view/widgets/horisontally_scroll_items.dart';
import 'package:sizer/sizer.dart';

import '../../models/cat.dart';

class Categories extends StatelessWidget {
  final Cat cat;
  const Categories({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List categories = [
      cat.adaptability,
      cat.intelligence,
      cat.rare,
      cat.hypoallergenic
      /*
      "Adaptability: ${cat.adaptability}",
      "Intelligence: ${cat.intelligence}",
      "Rare: ${cat.rare}",
      "Hypoallergenic: ${cat.hypoallergenic}"
      */
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: ((context, index) => horisontallyScrollableItems(
                  index,
                  categories,
                ))),
      ),
    );
  }
}
