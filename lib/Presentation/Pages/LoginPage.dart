// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
import 'package:furnizone/Presentation/Pages/ForgotPasswordPage.dart';
import 'package:furnizone/Presentation/Pages/HomePage.dart';
import 'package:furnizone/Presentation/Pages/RegisterPage.dart';
import 'package:furnizone/Presentation/Widgets/CustomBottomTextRow.dart';
import 'package:furnizone/Presentation/Widgets/CustomLabelColumn.dart';
import 'package:furnizone/Presentation/Widgets/CustomTopImage.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';
import 'package:furnizone/Presentation/Widgets/LoginForm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const Id = '/Login';

//GlobalKey<FormState> loginForm = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogInSuccess) {
          Navigator.pushNamed(context, Home.Id);
        } else if (state is LogInFailure) {
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
                  height: 350,
                  width: 800,
                  image: 'Assets/images/LoginBackground.jpg',
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLabelColumn(
                        title: 'Login',
                        titleSize: 36,
                        subTitle: 'Please sign in to continue',
                        subTitleSize: 16,
                      ),
                      SizedBox(
                        height: 56,
                      ),
                      LoginForm(
                          loginForm:
                              BlocProvider.of<AuthCubit>(context).loginForm),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, ForgotPassword.Id);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Mycolors.mainColor,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      state is LogInLoading
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButtonStyle(
                              title: 'Sign In',
                              fontSize: 24,
                              widthElevatedButton: SizeConfig.width * .9,
                              heightElevatedButton: 55,
                              onPressed: () {
                                if (BlocProvider.of<AuthCubit>(context)
                                    .loginForm
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<AuthCubit>(context).login();
                                }
                              },
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomBottomTextRow(
                        leading: 'Don’t have an account?',
                        tail: 'Sign Up',
                        tap: () {
                          Navigator.pushNamed(context, RegisterPage.Id);
                        },
                      )
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
