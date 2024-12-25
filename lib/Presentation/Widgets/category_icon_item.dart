import 'package:flutter/material.dart';

class CategoryIconItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const CategoryIconItem({
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff4A628A) : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100,
      height: 70,
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Color(0xff4A628A),
        // size: 30,
      ),
    );
  }
}
