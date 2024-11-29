// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Presentation/Widgets/RegisterCirclarContainer.dart';
import 'package:furnizone/Presentation/Widgets/RegisterCustomCurveContainer.dart';
import 'package:furnizone/Presentation/Widgets/RegisterForm.dart';
import 'package:furnizone/Presentation/Widgets/RegisterWelcomeText.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static const Id = '/Register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> registerForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: SizeConfig.width,
        height: SizeConfig.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: RegisterCustomCurveContainer(),
            ),
            Positioned(
              right: -SizeConfig.width * .19,
              top: -SizeConfig.height * .27,
              child: RegisterCirclarContainer(),
            ),
            Positioned(
              top: 40,
              left: 25,
              child: RegisterWelcomeText(),
            ),
            Positioned(
              top: SizeConfig.height * 0.22,
              bottom: 0,
              left: 0,
              right: 0,
              child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(24.0),
                  physics: BouncingScrollPhysics(),
                  children: [
                    RegisterForm(registerForm: registerForm),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
