import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   final TextEditingController controller;
  final String labelText;
  const CustomTextField({super.key, required this.controller, required this.labelText, });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText
      ),
    );
  }
}