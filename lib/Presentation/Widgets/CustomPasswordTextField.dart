import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Constant/MyColors.dart';



class CustomPasswordTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData preIcon;
  final TextEditingController? controller ;

  CustomPasswordTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.preIcon,
    this.controller,
  });

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}



class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool nonVisable = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: TextFormField(
        controller: widget.controller ,
        style: TextStyle(
            color: Mycolors.mainColor,
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.bold),
        obscureText: nonVisable,
        cursorColor: Mycolors.mainColor,
        enabled: true,
        validator: (value) {
          if (value!.isEmpty) return 'this field is required';
          if (value.length < 8)
            return 'Password must be 8 character at least';
          else
            return null;
        },
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: widget.label,
          labelStyle: TextStyle(
              color: Mycolors.mainColor,
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.bold),
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: Color(0xff828282),
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.symmetric(vertical: 16),
          prefixIconConstraints: BoxConstraints(minWidth: 60),
          suffixIconConstraints: BoxConstraints(minWidth: 60),
          prefixIconColor: Mycolors.mainColor,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: FaIcon(
              widget.preIcon,
              size: 24,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                nonVisable = !nonVisable;
              });
            },
            icon: FaIcon(
              nonVisable ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              size: 22,
            ),
          ),
          suffixIconColor: Mycolors.mainColor,
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