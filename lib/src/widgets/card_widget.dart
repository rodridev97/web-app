import 'dart:html';

import 'package:flutter/material.dart';

class CardCustomGifs extends StatelessWidget {
  const CardCustomGifs({
    Key? key,
    required this.urlImage,
    required this.title,
  }) : super(key: key);

  final String urlImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      width: 200.0,
      child: Card(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(urlImage, fit: BoxFit.cover),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
