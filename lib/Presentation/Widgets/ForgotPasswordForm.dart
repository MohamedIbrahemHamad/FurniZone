import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Presentation/Widgets/CustomAuthTextField.dart';


class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    super.key,
    required this.frgotPasswordForm,
  });

  final GlobalKey<FormState> frgotPasswordForm;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: frgotPasswordForm,
      child: CustomAuthTextField(
        label: 'E-mail',
        hint: 'Enter your e-mail',
        preIcon: FontAwesomeIcons.at,
      ),
    );
  }
}
