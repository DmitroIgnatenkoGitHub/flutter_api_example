import 'package:flutter_api_example/data/api_service.dart';
import 'package:flutter_api_example/models/cat_gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_example/models/cat.dart';
import 'package:sizer/sizer.dart';

class Gallery extends StatefulWidget {
  final Cat cat;
  const Gallery({super.key, required this.cat});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  Future? photos;
  ApiService apiService = ApiService();

  void photosList() {
    photos = apiService.getImagesUrlByBreedId(widget.cat.id);
  }

  @override
  void initState() {
    super.initState();
    photosList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: photos,
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
                return Card(
                  color: const Color.fromARGB(255, 68, 68, 68),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.h),
                  ),
                  child: Column(
                    children: <Widget>[
                      //*photo in card start
                      SizedBox(
                        height: 20.h,
                        width: 48.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.h),
                            topRight: Radius.circular(3.h),
                          ),
                        ),
                      ),
                      //*photo in card end
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              catData[index].url,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ],
                        ),
                      ),
                    ],
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
        });
  }
}
