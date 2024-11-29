import 'package:flutter/material.dart';
import 'package:furnizone/Presentation/Pages/ForgotPasswordPage.dart';
import 'package:furnizone/Presentation/Pages/GetStartedPage.dart';
import 'package:furnizone/Presentation/Pages/HomePage.dart';
import 'package:furnizone/Presentation/Pages/LoginPage.dart';
import 'package:furnizone/Presentation/Pages/OTPVerificationPage.dart';
import 'package:furnizone/Presentation/Pages/RegisterPage.dart';
import 'package:furnizone/Presentation/Pages/Resetpassword.dart';
import 'package:furnizone/Presentation/Pages/SuccessRegisterPage.dart';

Map<String, WidgetBuilder> MyRoutes = {
  Home.Id: (context) => const Home(),
  GetStarted.Id: (context) => const GetStarted(),
  RegisterPage.Id: (contect) => RegisterPage(),
  SuccessRegisterPage.Id: (contect) => SuccessRegisterPage(),
  LoginPage.Id: (context) => LoginPage(),
  ForgotPassword.Id: (context) => ForgotPassword(),
  OTPVerification.Id: (context) => OTPVerification(),
  ResetPasswordPage.Id: (context) => ResetPasswordPage(),
};
