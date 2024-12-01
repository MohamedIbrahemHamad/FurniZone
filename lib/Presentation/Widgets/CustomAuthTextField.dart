import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Constant/MyColors.dart';

class CustomAuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData preIcon;
  final TextEditingController? controller;
  const CustomAuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.preIcon,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
            color: Mycolors.mainColor,
            fontFamily: 'Inter',
            fontSize: 17,
            fontWeight: FontWeight.bold),
        cursorColor: Mycolors.mainColor,
        enabled: true,
        validator: (value) {
          if (value!.isEmpty)
            return 'this field is required';
          else
            return null;
        },
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: label,
          labelStyle: TextStyle(
              color: Mycolors.mainColor,
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.bold),
          hintText: hint,
          hintStyle: TextStyle(
              color: Color(0xff828282),
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.symmetric(vertical: 16),
          prefixIconConstraints: BoxConstraints(minWidth: 60),
          prefixIconColor: Mycolors.mainColor,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: FaIcon(
              preIcon,
              size: 20,
            ),
          ),
          filled: true,
          fillColor: Mycolors.thirdColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Mycolors.mainColor),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
