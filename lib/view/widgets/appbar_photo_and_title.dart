import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_api_example/data/api_service.dart';
import 'package:flutter_api_example/models/cat.dart';

class AppbarPhotoAndTitle extends StatelessWidget {
  final Cat cat;
  const AppbarPhotoAndTitle({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      SizedBox(
          width: 100.h,
          height: 40.h,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5.h),
            ),
            child: FutureBuilder(
              future: ApiService().getImageUrlByBreedId(cat.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String url = snapshot.data as String;
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ); // image is ready
                } else {
                  return const SizedBox(
                    height: 250,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ); // placeholder
                }
              },
            ),
          )),
      Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 70,
            width: MediaQuery.of(context).orientation == Orientation.landscape
                ? 95.h
                : 95.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.h),
                  topLeft: Radius.circular(5.h)),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      cat.name,
                      //'Название рецепта',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                )),
                const SizedBox(width: 5)
              ],
            ),
          ))
    ]);
  }
}
