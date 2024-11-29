// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Presentation/Pages/ForgotPasswordPage.dart';
import 'package:furnizone/Presentation/Pages/HomePage.dart';
import 'package:furnizone/Presentation/Pages/RegisterPage.dart';
import 'package:furnizone/Presentation/Widgets/CustomBottomTextRow.dart';
import 'package:furnizone/Presentation/Widgets/CustomLabelColumn.dart';
import 'package:furnizone/Presentation/Widgets/CustomTopImage.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';
import 'package:furnizone/Presentation/Widgets/LoginForm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const Id = '/Login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomTopImage(
              height: 350,
              width: 800,
              image: 'Assets/images/LoginBackground.jpg',
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelColumn(
                    title: 'Login',
                    titleSize: 36,
                    subTitle: 'Please sign in to continue',
                    subTitleSize: 16,
                  ),
                  SizedBox(
                    height: 56,
                  ),
                  LoginForm(loginForm: loginForm),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ForgotPassword.Id);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Mycolors.mainColor,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButtonStyle(
                    title: 'Sign In',
                    fontSize: 24,
                    widthElevatedButton: SizeConfig.width * .9,
                    heightElevatedButton: 55,
                    onPressed: () {
                      if (loginForm.currentState!.validate()) {
                        Navigator.pushNamed(context, Home.Id);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomBottomTextRow(
                    leading: 'Don’t have an account?',
                    tail: 'Sign Up',
                    tap: () {
                      Navigator.pushNamed(context, RegisterPage.Id);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
