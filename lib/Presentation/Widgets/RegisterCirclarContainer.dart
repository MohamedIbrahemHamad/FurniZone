import 'package:flutter/material.dart';
import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Constant/SizeConfg.dart';


class RegisterCirclarContainer extends StatelessWidget {
  const RegisterCirclarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Mycolors.thirdColor,
      ),
      width: SizeConfig.width * 0.51,
      height: SizeConfig.height * 0.51,
    );
  }
}
