import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/OTPVerificationPage.dart';
import 'package:furnizone/Presentation/Widgets/CustomLabelColumn.dart';
import 'package:furnizone/Presentation/Widgets/CustomTopImage.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';
import 'package:furnizone/Presentation/Widgets/ForgotPasswordForm.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  static const Id = '/ForgotPassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          Navigator.popAndPushNamed(context, OTPVerification.Id);
          BlocProvider.of<AuthCubit>(context).clearForgetPasswordForm();
        } else if (state is ForgetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomTopImage(
                  height: 600,
                  width: SizeConfig.width,
                  image: 'Assets/images/AuthImage.jpg',
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLabelColumn(
                        title: 'Forgot Password',
                        titleSize: 24,
                        subTitle:
                            'Please enter your email and we will send you \na code to your account',
                        subTitleSize: 16,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ForgotPasswordForm(
                          frgotPasswordForm: BlocProvider.of<AuthCubit>(context)
                              .forgotPasswordForm),
                      state is ForgetPasswordLoading
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButtonStyle(
                              title: 'Continue',
                              fontSize: 24,
                              widthElevatedButton: SizeConfig.width * .9,
                              heightElevatedButton: 55,
                              onPressed: () {
                                if (BlocProvider.of<AuthCubit>(context)
                                    .forgotPasswordForm
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<AuthCubit>(context)
                                      .forgetPassword();
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
      },
    );
  }
}
