import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/OTPVerificationPage.dart';
import 'package:pinput/pinput.dart';

class Otpform extends StatelessWidget {
  const Otpform({
    super.key,
    required this.verificationForm,
    required this.widget,
    required this.onComplete,
  });

  final GlobalKey<FormState> verificationForm;
  final OTPVerification widget;
  final void Function(String pin) onComplete;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: verificationForm,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Pinput(
          length: 6,
          defaultPinTheme: widget.defaultPinTheme,
          focusedPinTheme: widget.focusedPinTheme,
          submittedPinTheme: widget.submittedPinTheme,
          validator: (pin) {
            return pin!.isNotEmpty ? null : 'OTP code is required';
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          animationDuration: Duration(milliseconds: 550),
          animationCurve: Curves.bounceInOut,
          pinAnimationType: PinAnimationType.rotation,
          //  autofocus: true,
          onCompleted: onComplete,
          controller: BlocProvider.of<AuthCubit>(context).verificationPin,
        ),
      ),
    );
  }
}
