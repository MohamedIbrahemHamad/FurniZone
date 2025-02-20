import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/ResetPassword.dart';
import 'package:furnizone/Presentation/Widgets/CustomLabelColumn.dart';
import 'package:furnizone/Presentation/Widgets/CustomTopImage.dart';
import 'package:furnizone/Presentation/Widgets/OtpForm.dart';
import 'package:pinput/pinput.dart';

// ignore: camel_case_types, must_be_immutable
class OTPVerification extends StatefulWidget {
  static const Id = '/OTP_Verification';
  late PinTheme focusedPinTheme;
  late PinTheme defaultPinTheme;
  late PinTheme submittedPinTheme;

  OTPVerification({super.key}) {
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Mycolors.mainColor,
        fontWeight: FontWeight.w700,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        color: Mycolors.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Mycolors.mainColor),
      borderRadius: BorderRadius.circular(16),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      height: 58,
      textStyle: TextStyle(
        fontSize: 20,
        color: Mycolors.thirdColor,
        fontWeight: FontWeight.w700,
      ),
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Mycolors.mainColor,
      ),
    );
  }

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is VerifyOTPSuccess) {
          Navigator.popAndPushNamed(
            context,
            ResetPasswordPage.Id,
          );
          BlocProvider.of<AuthCubit>(context).clearVerificationForm();
        } else if (state is VerifyOTPFailure) {
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
                        title: 'OTP Verification',
                        titleSize: 24,
                        subTitle:
                            'We sent your code to your email \nthis code will expired in 3 minutes',
                        subTitleSize: 16,
                      ),
                      SizedBox(
                        height: 38,
                      ),
                      state is VerifyOTPLoading
                          ? Center(child: CircularProgressIndicator())
                          : Otpform(
                              verificationForm:
                                  BlocProvider.of<AuthCubit>(context)
                                      .verificationForm,
                              widget: widget,
                              onComplete: (pin) {
                                if (BlocProvider.of<AuthCubit>(context)
                                    .verificationForm
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<AuthCubit>(context)
                                      .verifyOTP();
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
