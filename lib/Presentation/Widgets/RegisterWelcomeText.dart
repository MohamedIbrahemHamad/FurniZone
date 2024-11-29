import 'package:flutter/material.dart';
import 'package:furnizone/Constant/MyColors.dart';


class RegisterWelcomeText extends StatelessWidget {
  const RegisterWelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Welcome,',
        style: TextStyle(
            color: Mycolors.thirdColor,
            fontFamily: 'PlayfairDisplay',
            fontSize: 45,
            fontWeight: FontWeight.w900),
      ),
      Text(
        'Create your account !',
        style: TextStyle(
            color: Mycolors.thirdColor,
            fontFamily: 'PlayfairDisplay',
            fontSize: 28,
            fontWeight: FontWeight.w800),
      ),
    ]);
  }
}
