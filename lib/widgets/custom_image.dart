import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
    );
  }
}
