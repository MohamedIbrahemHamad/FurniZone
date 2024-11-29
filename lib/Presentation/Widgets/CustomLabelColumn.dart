import 'package:flutter/material.dart';
import 'package:furnizone/Constant/MyColors.dart';


class CustomLabelColumn extends StatelessWidget {
  final String title;
  final String subTitle;
  final double titleSize;
  final double subTitleSize;

  const CustomLabelColumn({
    super.key,
    required this.title,
    required this.subTitle,
    required this.titleSize,
    required this.subTitleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Mycolors.mainColor,
              fontFamily: 'PlayfairDisplay',
              fontSize: titleSize,
              fontWeight: FontWeight.w900),
        ),
        Text(
          subTitle,
          style: TextStyle(
              color: Mycolors.secondColor,
              fontFamily: 'PlayfairDisplay',
              fontSize: subTitleSize,
              fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}







// class CustomLabelColumn extends StatelessWidget {
//   const CustomLabelColumn({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Login',
//           style: TextStyle(
//               color: Mycolors.mainColor,
//               fontFamily: 'PlayfairDisplay',
//               fontSize: 36,
//               fontWeight: FontWeight.w900),
//         ),
//         Text(
//           'Please sign in to continue',
//           style: TextStyle(
//               color: Mycolors.secondColor,
//               fontFamily: 'PlayfairDisplay',
//               fontSize: 16,
//               fontWeight: FontWeight.w800),
//         )
//       ],
//     );
//   }
// }