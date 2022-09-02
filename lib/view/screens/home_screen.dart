import 'package:flutter_api_example/view/widgets/item_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        title: const Text('The Cat API ',
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      ),
      body: const ItemCard()
    );
  }
}