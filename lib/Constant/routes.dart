import 'package:flutter/material.dart';
import 'package:furnizone/Data/cache/cache_helper.dart';
import 'package:furnizone/Presentation/Pages/AddProductPage.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/ForgotPasswordPage.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/GetStartedPage.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/LoginPage.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/OTPVerificationPage.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/RegisterPage.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/Resetpassword.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/SuccessRegisterPage.dart';
import 'package:furnizone/Presentation/Pages/HomePages/ProfilePage.dart';
import 'package:furnizone/Presentation/Pages/HomePages/bill_screen.dart';
import 'package:furnizone/Presentation/Pages/HomePages/cart_screen.dart';
import 'package:furnizone/Presentation/Pages/HomePages/completed_order.dart';
import 'package:furnizone/Presentation/Pages/HomePages/home_screen.dart';
import 'package:furnizone/Presentation/Pages/HomePages/main_screen.dart';
import 'package:furnizone/Presentation/Pages/HomePages/product_details_screen.dart';

Map<String, WidgetBuilder> MyRoutes = {
  GetStarted.Id: (context) => const GetStarted(),
  RegisterPage.Id: (contect) => RegisterPage(),
  SuccessRegisterPage.Id: (contect) => SuccessRegisterPage(),
  LoginPage.Id: (context) => LoginPage(),
  ForgotPassword.Id: (context) => ForgotPassword(),
  OTPVerification.Id: (context) => OTPVerification(),
  ResetPasswordPage.Id: (context) => ResetPasswordPage(),
  AddProductPage.id: (context) => AddProductPage(),
  //
  HomeScreen.id: (context) => HomeScreen(),
  CartScreen.id: (context) => CartScreen(),
  BillScreen.id: (context) => BillScreen(),
  CompletedOrder.id: (context) => CompletedOrder(),
  ProfilePage.id: (context) => ProfilePage(),
  ProductDetailsScreen.id: (context) => ProductDetailsScreen(),
  MainScreen.id: (context) => MainScreen(
        isAdmin: CacheHelper().getData(key: 'isAdmin'),
      ),
};
