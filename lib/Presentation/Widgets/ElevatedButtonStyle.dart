import 'package:flutter/material.dart';


class ElevatedButtonStyle extends StatelessWidget {
  const ElevatedButtonStyle(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.fontSize,
      required this.widthElevatedButton,
      required this.heightElevatedButton});
  final VoidCallback onPressed;
  final String title;
  final double fontSize;

  final double widthElevatedButton;
  final double heightElevatedButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(40), // Adjust the radius as needed
          ),
        ),
        elevation: WidgetStateProperty.all<double>(0),
        backgroundColor: WidgetStateProperty.all<Color>(
          const Color(0xFF4A628A),
        ),
        fixedSize: WidgetStateProperty.all<Size>(
            Size(widthElevatedButton, heightElevatedButton)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
