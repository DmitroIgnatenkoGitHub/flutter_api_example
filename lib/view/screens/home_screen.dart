import 'package:flutter_api_example/view/widgets/item_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 56, 56, 56),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text('The Cat Library',
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        elevation: 0,
        backgroundColor: const Color.fromARGB(146, 85, 85, 85),
      ),
      body: const ItemCard()
    );
  }
}