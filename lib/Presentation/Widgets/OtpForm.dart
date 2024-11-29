import 'package:flutter/material.dart';
import 'package:furnizone/Presentation/Pages/OTPVerificationPage.dart';
import 'package:furnizone/Presentation/Pages/ResetPassword.dart';
import 'package:pinput/pinput.dart';


class Otpform extends StatelessWidget {
  const Otpform({
    super.key,
    required this.VerificationForm,
    required this.widget,
  });

  final GlobalKey<FormState> VerificationForm;
  final OTPVerification widget;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: VerificationForm,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Pinput(
          length: 6,
          defaultPinTheme: widget.defaultPinTheme,
          focusedPinTheme: widget.focusedPinTheme,
          submittedPinTheme: widget.submittedPinTheme,
          validator: (pin) {
            return pin == '777777'
                ? null
                : 'code is incorrect or expired';
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          animationDuration: Duration(milliseconds: 550),
          animationCurve: Curves.bounceInOut,
          pinAnimationType: PinAnimationType.rotation,
          //  autofocus: true,
          onCompleted: (pin) {
            if (VerificationForm.currentState!.validate()) {
              print(pin);
              Navigator.popAndPushNamed(
                context,
                ResetPasswordPage.Id,
              );
            }
          },
        ),
      ),
    );
  }
}
