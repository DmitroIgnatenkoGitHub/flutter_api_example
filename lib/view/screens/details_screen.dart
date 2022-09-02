import 'package:flutter_api_example/view/widgets/appbar_photo_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_example/models/cat.dart';
import 'package:sizer/sizer.dart';

class DetailsScreen extends StatelessWidget {
  final Cat cat;

  const DetailsScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              pinned: true,
              expandedHeight: 40.h,
              flexibleSpace: FlexibleSpaceBar(
                background: AppbarPhotoAndTitle(cat: cat),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100.h,
                //mainAxisSpacing: 10.0,
                //crossAxisSpacing: 10.0,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    //color: kWhitethemecolor,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50.h,
                          child: Text(
                            cat.description,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ));
  }
}
