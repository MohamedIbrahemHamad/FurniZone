import 'package:flutter/material.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Presentation/Pages/LoginPage.dart';
import 'package:furnizone/Presentation/Widgets/CustomLabelColumn.dart';
import 'package:furnizone/Presentation/Widgets/CustomTopImage.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';
import 'package:furnizone/Presentation/Widgets/ReserPassForm.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});
  static const Id = '/ResetPassword';

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> resetPasswordForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomTopImage(
              height: 530,
              width: SizeConfig.width,
              image: 'Assets/images/AuthImage.jpg',
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelColumn(
                    title: 'Reset Password',
                    titleSize: 24,
                    subTitle:
                        'Please set the new password for your account\nso you can login and access at the features',
                    subTitleSize: 16,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ResetPassForm(ResetPasswordForm: resetPasswordForm),
                  ElevatedButtonStyle(
                    title: 'Continue',
                    fontSize: 24,
                    widthElevatedButton: SizeConfig.width * .9,
                    heightElevatedButton: 55,
                    onPressed: () {
                      if (resetPasswordForm.currentState!.validate()) {
                        Navigator.pushNamed(context, LoginPage.Id);
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
