import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget horisontallyScrollableItems(
  int index,
  List items,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 1.w),
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
      ),
      decoration: BoxDecoration(
          color: items[index] == 0
              ? const Color.fromARGB(255, 255, 84, 72)
              : items[index] == 1
                  ? const Color.fromARGB(255, 255, 123, 0)
                  : items[index] == 2
                      ? Colors.amber
                      : items[index] == 3
                          ? const Color.fromARGB(255, 190, 207, 37)
                          : items[index] == 4
                              ? const Color.fromARGB(255, 88, 221, 0)
                              : const Color.fromARGB(255, 70, 150, 255),
          borderRadius: BorderRadius.circular(5.w)),
      child: Text(
        index==0?"Adaptability: ${items[index]}":
        index==1?"Intelligence: ${items[index]}":
        index==2?"Rare: ${items[index]}":
        "Hypoallergenic: ${items[index]}",
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255)),
      ),
    ),
  );
}
