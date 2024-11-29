// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Presentation/Widgets/TextStyleWidget.dart';

class CustomBottomTextRow extends StatelessWidget {
  final String leading;
  final String tail;
  final VoidCallback tap;
  const CustomBottomTextRow({
    Key? key,
    required this.leading,
    required this.tail,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextStyleWidget(
              fontFamily: 'Inter',
              text: leading,
              color: Mycolors.secondColor,
              fontSize: 20,
              fontWeight: FontWeight.w700),
          InkWell(
            onTap: tap ,
            child: TextStyleWidget(
                fontFamily: 'Poppins',
                text: tail,
                color: Mycolors.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
