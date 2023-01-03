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
          color: const Color.fromARGB(255, 203, 227, 255),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 111, 144, 182),
              spreadRadius: 0.2,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5.w)),
      child: Text(
        items[index],
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 24, 94, 160)),
      ),
    ),
  );
}
