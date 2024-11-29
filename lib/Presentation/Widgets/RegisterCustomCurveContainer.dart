import 'package:flutter/material.dart';
import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Helper/RegisterCliper.dart';


class RegisterCustomCurveContainer extends StatelessWidget {
  const RegisterCustomCurveContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RegisterCliper(),
      child: Container(
        color: Mycolors.mainColor,
        width: SizeConfig.width,
        height: SizeConfig.height * 0.32,
      ),
    );
  }
}
