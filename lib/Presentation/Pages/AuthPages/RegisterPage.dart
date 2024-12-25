// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/SuccessRegisterPage.dart';
import 'package:furnizone/Presentation/Widgets/RegisterCirclarContainer.dart';
import 'package:furnizone/Presentation/Widgets/RegisterCustomCurveContainer.dart';
import 'package:furnizone/Presentation/Widgets/RegisterForm.dart';
import 'package:furnizone/Presentation/Widgets/RegisterWelcomeText.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static const Id = '/Register';
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.popAndPushNamed(context, SuccessRegisterPage.Id);
          BlocProvider.of<AuthCubit>(context).clearRegisterForm();
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: SizeConfig.width,
            height: SizeConfig.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: RegisterCustomCurveContainer(),
                ),
                Positioned(
                  right: -SizeConfig.width * .19,
                  top: -SizeConfig.height * .27,
                  child: RegisterCirclarContainer(),
                ),
                Positioned(
                  top: 40,
                  left: 25,
                  child: RegisterWelcomeText(),
                ),
                Positioned(
                  top: SizeConfig.height * 0.22,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(24.0),
                      physics: BouncingScrollPhysics(),
                      children: [
                        state is RegisterLoading
                            ? RegisterForm(
                                isLoading: true,
                                registerForm:
                                    BlocProvider.of<AuthCubit>(context)
                                        .registerForm)
                            : RegisterForm(
                                isLoading: false,
                                registerForm:
                                    BlocProvider.of<AuthCubit>(context)
                                        .registerForm),
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
