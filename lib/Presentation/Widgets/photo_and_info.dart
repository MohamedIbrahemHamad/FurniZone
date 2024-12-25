import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'photo_cart.dart';
import 'product_cart_info.dart';

class PhotoAndInfo extends StatelessWidget {
  const PhotoAndInfo({
    super.key,
    required this.title,
    required this.moreDetiles,
    required this.price,
     this.image,
  });

  final Uint8List? image;
  final String title;
  final String moreDetiles;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PhotoCart(image: image!),
        ProductCartInfo(
          title: title,
          moreDetiles: moreDetiles,
          price: price,
        ),
      ],
    );
  }
}
