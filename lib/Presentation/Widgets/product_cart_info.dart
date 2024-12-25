import 'package:flutter/material.dart';
import 'package:furnizone/Presentation/Widgets/TextStyleWidget.dart';



class ProductCartInfo extends StatelessWidget {
  const ProductCartInfo(
      {super.key,
      required this.title,
      required this.moreDetiles,
      required this.price});

  final String title;
  final String moreDetiles;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyleWidget(
            text: title,
            color: Color(0xFF4A628A),
            fontSize: 16,
            fontWeight: FontWeight.bold, fontFamily: 'popins',),
        TextStyleWidget(
            text: moreDetiles,
            color: Color(0xFF6F7384),
            fontSize: 14,
            fontWeight: FontWeight.normal, fontFamily: 'popins',),
        TextStyleWidget(
            text: price.toString(),
            color: Color(0xFF4A628A),
            fontSize: 19,
            fontWeight: FontWeight.w600, fontFamily: 'popins',),
      ],
    );
  }
}
