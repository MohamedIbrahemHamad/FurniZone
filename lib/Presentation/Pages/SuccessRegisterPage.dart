import 'package:flutter/material.dart';
import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Presentation/Pages/LoginPage.dart';
import 'package:furnizone/Presentation/Widgets/CustomTopImage.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';

class SuccessRegisterPage extends StatelessWidget {
  const SuccessRegisterPage({super.key});
  static const Id = '/SuccessRegisterPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopImage(
            height: 350,
            width: 800,
            image: 'Assets/images/LoginBackground.jpg',
          ),
          Spacer(),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF44AD00),
              borderRadius: BorderRadius.all(Radius.circular(4000)),
            ),
            alignment: Alignment.center,
            width: 160,
            height: 160,
            child: const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 100,
            ),
          ),
          Spacer(flex: 2),
          const Text(
            'Register Success',
            style: TextStyle(
               fontFamily: 'Inter',
              color: Mycolors.mainColor,
              fontWeight: FontWeight.w900,
              fontSize: 32,
            ),
          ),
          Spacer(flex: 2),
          ElevatedButtonStyle(
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.Id);
              },
              title: 'Continue',
              fontSize: 24,
              widthElevatedButton: 380,
              heightElevatedButton: 56),
          Spacer(),
        ],
      ),
    );
  }
}
















