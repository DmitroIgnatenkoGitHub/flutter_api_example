import 'package:flutter_api_example/utils/theme.dart';
import 'package:flutter_api_example/view/widgets/appbar_photo_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_example/models/cat.dart';
import 'package:flutter_api_example/view/widgets/categories.dart';
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
        backgroundColor: ThemeColor.darkBackground,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Characteristics from 0 to 5. 0 is bad, 5 is excellent:",
                        style: TextStyle(fontSize: 22, color: ThemeColor.white),
                      ),
                      Categories(cat: cat),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                "Description:",
                                style: TextStyle(
                                    fontSize: 32, color: ThemeColor.white),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cat.description,
                              style: TextStyle(
                                  fontSize: 24, color: ThemeColor.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            cat.wikiUrl != null
                                ? GestureDetector(
                                    onTap: () async {
                                      var url = Uri.parse("${cat.wikiUrl}");

                                      await launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).orientation ==
                                                  Orientation.landscape
                                              ? 100.h
                                              : 100.w,
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 132, 161, 255),
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
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: 28),
                                            ),
                                            Text(
                                              "${cat.wikiUrl}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: ThemeColor.white,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
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
