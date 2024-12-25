import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class PhotoCart extends StatelessWidget {
  const PhotoCart({super.key, required this.image});
  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      height: 92,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: MemoryImage(image),
        ),
      ),
    );
  }
}
