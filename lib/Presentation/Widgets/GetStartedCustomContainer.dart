import 'package:flutter/material.dart';
import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Helper/GetStatredCliper.dart';

class GetStartedCustomContainer extends StatelessWidget {
  const GetStartedCustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GetStatredCliper(),
      child: Container(
        color: Mycolors.mainColor,
        width: SizeConfig.width,
        height: SizeConfig.height * 0.44,
      ),
    );
  }
}
