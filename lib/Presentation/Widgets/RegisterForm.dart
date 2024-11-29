import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Presentation/Pages/LoginPage.dart';
import 'package:furnizone/Presentation/Pages/SuccessRegisterPage.dart';
import 'package:furnizone/Presentation/Widgets/CustomAuthTextField.dart';
import 'package:furnizone/Presentation/Widgets/CustomPasswordTextField.dart';
import 'package:furnizone/Presentation/Widgets/CustomBottomTextRow.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.registerForm,
  });

  final GlobalKey<FormState> registerForm;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerForm,
      child: Column(
        children: [
          CustomAuthTextField(
            label: 'First name',
            hint: 'Enter your first name',
            preIcon: FontAwesomeIcons.user,
          ),
          CustomAuthTextField(
            label: 'Last name',
            hint: 'Enter your last name',
            preIcon: FontAwesomeIcons.user,
          ),
          CustomAuthTextField(
            label: 'E-mail',
            hint: 'Enter your e-mail',
            preIcon: FontAwesomeIcons.at,
          ),
          CustomAuthTextField(
            label: 'Phone number',
            hint: 'Enter your phone number',
            preIcon: FontAwesomeIcons.mobileScreen,
          ),
          CustomPasswordTextField(
            label: 'Password',
            hint: 'Enter password',
            preIcon: Icons.lock_outline_rounded,
          ),
          CustomPasswordTextField(
            label: 'Confirm Password',
            hint: 'Re-enter password to confirm',
            preIcon: Icons.lock_outline_rounded,
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButtonStyle(
            title: 'Sign UP',
            fontSize: 24,
            widthElevatedButton: SizeConfig.width * .9,
            heightElevatedButton: 55,
            onPressed: () {
              if (registerForm.currentState!.validate()) {
                Navigator.pushNamed(context, SuccessRegisterPage.Id);
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomBottomTextRow(
            leading: 'Already have an account?',
            tail: 'Sign In',
            tap: () {
              Navigator.pushNamed(context, LoginPage.Id);
            },
          )
        ],
      ),
    );
  }
}
