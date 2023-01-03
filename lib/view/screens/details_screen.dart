import 'package:flutter_api_example/view/widgets/appbar_photo_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_example/models/cat.dart';
import 'package:flutter_api_example/view/widgets/categories.dart';
import 'package:flutter_api_example/view/widgets/gallery.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final Cat cat;

  const DetailsScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppbarPhotoAndTitle(cat: cat),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Column(
                    children: [
                       const SizedBox(height: 10,),
                                const Text(
                                    "Characteristics from 0 to 5. 0 is bad, 5 is excellent:",
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.white),
                                  ),
                                Categories(cat: cat),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 68, 68, 68),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 2,
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: const Text(
                                    "Description:",
                                    style: TextStyle(
                                        fontSize: 32, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  cat.description,
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var url = Uri.parse("${cat.wikiUrl}");

                                    await launchUrl(url,
                                        mode: LaunchMode.externalApplication);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).orientation ==
                                            Orientation.landscape
                                        ? 100.h
                                        : 100.w,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 132, 161, 255),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          const Text(
                                            "This cat on wikipedia:",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                //decoration: TextDecoration.underline,
                                                color: Color.fromARGB(255, 255, 255, 255),
                                                fontSize: 30),
                                          ),
                                          Text(
                                            "${cat.wikiUrl}",
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Color.fromARGB(255, 255, 255, 255),
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Container(
                                  width: 100.w,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      "Origin: ${cat.origin}",
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
