import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final bool isLoading;
  final bool obscureText;
  final String labelText;
  final void Function(String)? onChanged;
  final String initialValue;
  final String? Function(String?)? validator;

  const MyTextFormField(
      {super.key,
      required this.isLoading,
      this.onChanged,
      this.obscureText = false,
      required this.labelText,
      this.initialValue = "",
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      enabled: !isLoading,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
