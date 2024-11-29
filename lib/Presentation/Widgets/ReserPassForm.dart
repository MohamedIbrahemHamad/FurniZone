import 'package:flutter/material.dart';
import 'package:furnizone/Presentation/Widgets/CustomPasswordTextField.dart';


class ResetPassForm extends StatelessWidget {
  const ResetPassForm({
    super.key,
    required this.ResetPasswordForm,
  });

  final GlobalKey<FormState> ResetPasswordForm;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ResetPasswordForm,
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
