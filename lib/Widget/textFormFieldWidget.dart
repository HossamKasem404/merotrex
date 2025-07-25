import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  //this is constructor to take the value for this variable
  TextFormFieldWidget({
    required this.controller,
    required this.hintText,
    required this.icon,
    validator,
    this.suffixIcon,
    required this.obscureText,
    this.type,
    this.onTap,
    this.allowEmpty = false,
  });
  //this is value what we need
  final bool allowEmpty;
  TextEditingController controller = TextEditingController();
  String hintText;
  Icon icon;
  Widget? suffixIcon;
  String? Function(String? value)? validator;
  bool obscureText;
  TextInputType? type;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 10,
            offset: Offset(0, 13),
          ),
        ],
      ),
      child: TextFormField(
        onTap: onTap,
        obscureText: obscureText,
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }
}
