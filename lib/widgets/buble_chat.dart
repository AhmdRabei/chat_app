import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';

import 'package:flutter/material.dart';

class BubleChat extends StatelessWidget {
  const BubleChat({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class BubleRevirseChat extends StatelessWidget {
  const BubleRevirseChat({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Color.fromARGB(255, 135, 162, 175),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
