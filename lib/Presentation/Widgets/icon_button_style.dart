import 'package:flutter/material.dart';

class IconButtonStyle extends StatelessWidget {
  IconButtonStyle(
      {super.key,
      required this.iconColor,
      required this.iconShape,
      required this.iconSize,
      required this.buttonWidth,
      required this.buttonHeight,
      this.onPressed});
  final Color iconColor;
  final IconData iconShape;
  final double iconSize;
  final double buttonWidth;
  final double buttonHeight;
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(2),
        icon: Icon(
          iconShape,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
