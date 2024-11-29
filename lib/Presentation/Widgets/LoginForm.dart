import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Presentation/Widgets/CustomAuthTextField.dart';
import 'package:furnizone/Presentation/Widgets/CustomPasswordTextField.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.loginForm,
  });

  final GlobalKey<FormState> loginForm;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginForm,
      child: Column(
        children: [
          CustomAuthTextField(
            label: 'User name',
            hint: 'Enter user name',
            preIcon: FontAwesomeIcons.at,
          ),
          CustomPasswordTextField(
            label: 'Password',
            hint: 'Enter password',
            preIcon: Icons.lock_outline_rounded,
          ),
        ],
      ),
    );
  }
}
