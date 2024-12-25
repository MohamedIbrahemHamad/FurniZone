import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/LoginPage.dart';
import 'package:furnizone/Presentation/Widgets/CustomLabelColumn.dart';
import 'package:furnizone/Presentation/Widgets/CustomTopImage.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';
import 'package:furnizone/Presentation/Widgets/ReserPassForm.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});
  static const Id = '/ResetPassword';

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Navigator.popAndPushNamed(context, LoginPage.Id);
          BlocProvider.of<AuthCubit>(context).clearResetPasswordForm();
        } else if (state is ResetPasswordFailure) {
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
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomTopImage(
                  height: 530,
                  width: SizeConfig.width,
                  image: 'Assets/images/AuthImage.jpg',
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLabelColumn(
                        title: 'Reset Password',
                        titleSize: 24,
                        subTitle:
                            'Please set the new password for your account\nso you can login and access at the features',
                        subTitleSize: 16,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ResetPassForm(
                          resetPasswordForm: BlocProvider.of<AuthCubit>(context)
                              .resetPasswordForm),
                      state is ResetPasswordLoading
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButtonStyle(
                              title: 'Continue',
                              fontSize: 24,
                              widthElevatedButton: SizeConfig.width * .9,
                              heightElevatedButton: 55,
                              onPressed: () {
                                if (BlocProvider.of<AuthCubit>(context)
                                    .resetPasswordForm
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<AuthCubit>(context)
                                      .resetPassword();
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
