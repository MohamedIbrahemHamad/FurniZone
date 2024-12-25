import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
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
        controller: BlocProvider.of<AuthCubit>(context).forgotPasswordEmail,
      ),
    );
  }
}
