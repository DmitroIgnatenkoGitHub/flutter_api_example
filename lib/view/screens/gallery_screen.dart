import 'package:flutter_api_example/data/api_service.dart';
import 'package:flutter_api_example/models/cat_gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_example/models/cat.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/theme.dart';

class GalleryScreen extends StatelessWidget {
  final Cat cat;
  const GalleryScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ThemeColor.darkBackground,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Text(
          '${cat.name} gallery',
          style: TextStyle(color: ThemeColor.white),
        ),
        elevation: 0,
        backgroundColor: ThemeColor.darkGrey,
      ),
      body: FutureBuilder(
          future: ApiService().getGalleryByBreedId(cat.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CatGallery> catData = snapshot.data as List<CatGallery>;
              return GridView.builder(
                itemCount: catData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 4
                        : 2,
                    crossAxisSpacing: 1.w,
                    mainAxisSpacing: 1.h,
                    childAspectRatio:
                        0.9 //?the length of the card, but there are problems in some screens
                    ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      var url = Uri.parse(catData[index].url);

                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    },
                    child: Card(
                      color: ThemeColor.darkGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.h),
                      ),
                      child: SizedBox(
                        height: 25.h,
                        width: 48.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.h),
                          ),
                          child: FutureBuilder(
                            future:
                                ApiService().getGalleryByBreedId(cat.id),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                //loading photo
                                return Container(
                                  decoration: BoxDecoration(
                                    color: ThemeColor.darkGrey,
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(catData[index].url),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              } else {
                                // loading circular indicator
                                return const SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
