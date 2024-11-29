import 'package:flutter/material.dart';
import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Presentation/Widgets/GetStartedNextButton.dart';

class GetStartedCustomRow extends StatelessWidget {
  const GetStartedCustomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width * .52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          bottomLeft: Radius.circular(35),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            GetStartedNextButton(),
            SizedBox(
              width: 10,
            ),
            Text(
              'Get Start...',
              style: TextStyle(
                  color: Mycolors.mainColor,
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}