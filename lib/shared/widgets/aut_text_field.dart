import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:taskify/shared/widgets/text_field.dart';
import 'package:taskify/shared/widgets/text_field_container.dart';

class AuthTextField extends HookWidget {
  AuthTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hintText,
      this.obscureText = false});

  TextEditingController controller;
  String label;
  String hintText;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        TextFieldContainer(
          child: MyTextField(
            hintText: hintText,
            onChange: (value) {},
            controller: controller,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
