import 'package:flutter/material.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Constant/Strings.dart';
import 'package:furnizone/Presentation/Widgets/GetStartTextColumn.dart';
import 'package:furnizone/Presentation/Widgets/GetStartedCustomContainer.dart';
import 'package:furnizone/Presentation/Widgets/GetStartedCustomRow.dart';

class GetStarted extends StatelessWidget {
  static const Id = '/';
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              getStartedImage,
            ),
          ),
          Positioned(
            top: SizeConfig.height * .56,
            child: GetStartedCustomContainer(),
          ),
          Positioned(
            left: SizeConfig.width * .15,
            bottom: SizeConfig.height * .18,
            child: GetStartTextColumn(),
          ),
          Positioned(
            right: 0,
            bottom: SizeConfig.height * .05,
            child: GetStartedCustomRow(),
          ),
        ],
      ),
    );
  }
}
