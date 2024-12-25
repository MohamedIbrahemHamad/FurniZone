import 'package:flutter/material.dart';
import 'package:furnizone/Presentation/Widgets/TextStyleWidget.dart';
import 'icon_button_style.dart';


class AppBarStyle extends StatelessWidget implements PreferredSizeWidget {
  AppBarStyle(
      {super.key, required this.title, this.onPressedIconLeft, this.icon});
  final String title;
  Function()? onPressedIconLeft;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.all(2),
          child: IconButtonStyle(
            iconColor: Color(0xFF304E3E),
            iconShape: Icons.arrow_back_ios_new,
            iconSize: 25,
            buttonWidth: 50,
            buttonHeight: 50,
            onPressed: onPressedIconLeft,
          ),
        ),
        centerTitle: true,
        title: TextStyleWidget(
            text: title,
            color: Color(0xFF304E3E),
            fontSize: 24,
            fontWeight: FontWeight.bold, fontFamily: 'popins',),
        actions: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: IconButtonStyle(
                iconColor: Color(0xFF304E3E),
                iconShape: icon!,
                iconSize: 25,
                buttonWidth: 50,
                buttonHeight: 50,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
