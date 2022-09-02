import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_api_example/view/screens/home_screen.dart';

void main() {
  runApp(const AnimalApp());
}

class AnimalApp extends StatelessWidget {
  const AnimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    //!Using sizer for comfortable work with screen sizes :)
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        home: HomeScreen(),
      );
    });
  }
}
