import 'package:flutter_api_example/data/api_service.dart';
import 'package:flutter_api_example/view/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_example/models/cat.dart';
import 'package:sizer/sizer.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  Future? cats;
  ApiService apiService = ApiService();

  void populateList() {
    cats = apiService.getAllCats();
  }

  @override
  void initState() {
    super.initState();
    populateList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cats,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Cat> catData = snapshot.data as List<Cat>;
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
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen(cat: catData[index]);
                                },
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 20.h,
                            width: 48.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3.h),
                                topRight: Radius.circular(3.h),
                              ),
                              child: FutureBuilder(
                                future: apiService
                                    .getImageUrlByBreedId(catData[index].id),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    String url = snapshot.data as String;
                                    //loading photo
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 68, 68, 68),
                                        image: DecorationImage(
                                          image: NetworkImage(url),
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
                          )),
                      //*photo in card end
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              catData[index].name,
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
