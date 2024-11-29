import 'package:flutter/material.dart';


class CustomTopImage extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  const CustomTopImage({
    super.key,
    required this.height,
    required this.width,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
