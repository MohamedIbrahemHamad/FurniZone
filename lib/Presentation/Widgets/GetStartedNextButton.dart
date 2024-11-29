import 'package:flutter/material.dart';
import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Presentation/Pages/LoginPage.dart';

class GetStartedNextButton extends StatelessWidget {
  const GetStartedNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Mycolors.mainColor),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, LoginPage.Id);
        },
        icon: Icon(Icons.arrow_forward_ios_sharp),
        color: Colors.white,
      ),
    );
  }
}
