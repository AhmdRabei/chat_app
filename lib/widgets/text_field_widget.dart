import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.label,
      this.onChange,
      required this.validatorText,
      required this.obScureText});
  final String label;
  final String validatorText;
  Function(String)? onChange;
  final bool obScureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obScureText,
      validator: (data) {
        if (data!.isEmpty) {
          return validatorText;
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Cairo',
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
