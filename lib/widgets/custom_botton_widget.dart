import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({super.key, required this.buttonTitle, this.onTap});
  final String buttonTitle;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
