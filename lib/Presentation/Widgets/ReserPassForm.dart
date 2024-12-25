import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
import 'package:furnizone/Presentation/Widgets/CustomPasswordTextField.dart';


class ResetPassForm extends StatelessWidget {
  const ResetPassForm({
    super.key,
    required this.resetPasswordForm,
  });

  final GlobalKey<FormState> resetPasswordForm;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetPasswordForm,
      child: Column(
        children: [
          CustomPasswordTextField(
            label: 'Password',
            hint: 'Enter password',
            preIcon: Icons.lock_outline_rounded,
            controller: BlocProvider.of<AuthCubit>(context).newPassword,  
          ),
          CustomPasswordTextField(
            label: 'Confirm Password',
            hint: 'Re-enter password to confirm',
            preIcon: Icons.lock_outline_rounded,
            controller: BlocProvider.of<AuthCubit>(context).confirmNewPassword,
          ),
        ],
      ),
    );
  }
}
