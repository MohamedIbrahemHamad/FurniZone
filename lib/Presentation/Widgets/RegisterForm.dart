// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/LoginPage.dart';
import 'package:furnizone/Presentation/Widgets/CustomAuthTextField.dart';
import 'package:furnizone/Presentation/Widgets/CustomBottomTextRow.dart';
import 'package:furnizone/Presentation/Widgets/CustomPasswordTextField.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.registerForm,
    required this.isLoading,
  });
  final bool isLoading;
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
            controller: BlocProvider.of<AuthCubit>(context).registerFirstName,
          ),
          CustomAuthTextField(
            label: 'Last name',
            hint: 'Enter your last name',
            preIcon: FontAwesomeIcons.user,
            controller: BlocProvider.of<AuthCubit>(context).registerLastName,
          ),
          CustomAuthTextField(
            label: 'E-mail',
            hint: 'Enter your e-mail',
            preIcon: FontAwesomeIcons.at,
            controller: BlocProvider.of<AuthCubit>(context).registerEmail,
          ),
          CustomAuthTextField(
            label: 'Phone number',
            hint: 'Enter your phone number',
            preIcon: FontAwesomeIcons.mobileScreen,
            controller: BlocProvider.of<AuthCubit>(context).registerPhone,
          ),
          CustomPasswordTextField(
            label: 'Password',
            hint: 'Enter password',
            controller: BlocProvider.of<AuthCubit>(context).registerPassword,
            preIcon: Icons.lock_outline_rounded,
          ),
          CustomPasswordTextField(
            label: 'Confirm Password',
            hint: 'Re-enter password to confirm',
            preIcon: Icons.lock_outline_rounded,
            controller:
                BlocProvider.of<AuthCubit>(context).registerConfirmPassword,
          ),
          SizedBox(
            height: 50,
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : ElevatedButtonStyle(
                  title: 'Sign UP',
                  fontSize: 24,
                  widthElevatedButton: SizeConfig.width * .9,
                  heightElevatedButton: 55,
                  onPressed: () {
                    if (registerForm.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).register();
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
