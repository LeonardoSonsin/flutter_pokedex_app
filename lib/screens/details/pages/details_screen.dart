import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.name, required this.image}) : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(image),
          Text(name)
      ],
      ),
    );
  }
}
