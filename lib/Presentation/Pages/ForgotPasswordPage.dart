import 'package:flutter/material.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Presentation/Pages/OTPVerificationPage.dart';
import 'package:furnizone/Presentation/Widgets/CustomLabelColumn.dart';
import 'package:furnizone/Presentation/Widgets/CustomTopImage.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';
import 'package:furnizone/Presentation/Widgets/ForgotPasswordForm.dart';

class ForgotPassword extends StatefulWidget {
 const ForgotPassword({super.key});
  static const Id = '/ForgotPassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> frgotPasswordForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomTopImage(
              height: 600,
              width: SizeConfig.width,
              image: 'Assets/images/AuthImage.jpg',
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelColumn(
                    title: 'Forgot Password',
                    titleSize: 24,
                    subTitle:
                        'Please enter your email and we will send you \na code to your account',
                    subTitleSize: 16,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ForgotPasswordForm(frgotPasswordForm: frgotPasswordForm),
                  ElevatedButtonStyle(
                    title: 'Continue',
                    fontSize: 24,
                    widthElevatedButton: SizeConfig.width * .9,
                    heightElevatedButton: 55,
                    onPressed: () {
                      if (frgotPasswordForm.currentState!.validate()) {
                        Navigator.pushNamed(context, OTPVerification.Id);
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
