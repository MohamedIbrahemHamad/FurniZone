import 'package:flutter/material.dart';


class TextStyleWidget extends StatelessWidget {
  const TextStyleWidget(
      {super.key,
      required this.fontFamily,
      required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight});

  final String text;
  final String fontFamily;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
