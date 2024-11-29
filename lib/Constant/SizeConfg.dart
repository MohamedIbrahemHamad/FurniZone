import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double width;
  static late double height;
  
  static void initialization(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
  
}
