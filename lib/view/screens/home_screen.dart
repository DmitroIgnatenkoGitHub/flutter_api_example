import 'package:flutter_api_example/view/widgets/item_card.dart';
import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            'The Cat Library',
            style: TextStyle(color: ThemeColor.white),
          ),
          elevation: 0,
          backgroundColor: ThemeColor.darkGrey,
        ),
        body: const ItemCard());
  }
}
