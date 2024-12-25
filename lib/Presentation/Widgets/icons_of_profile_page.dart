import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconsProfilepage extends StatelessWidget{
  const IconsProfilepage({required this.icon});
  final IconData icon ;
  @override
  Widget build(BuildContext context) {

    return IconButton(
      onPressed: (){},
     icon: Icon(
      icon,
      color: Color(0xffFFFFFF),
      size: 38,
     ));
  }

}