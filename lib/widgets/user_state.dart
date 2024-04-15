// ignore_for_file: unrelated_type_equality_checks

import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserState extends StatelessWidget {
  const UserState({super.key});
  static String id = 'UserState';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState) {
          if (snapshot.hasData) {
            return ChatView();
          } else {
            return LoginView();
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.hasError.toString()),
          );
        } else {
          return Center(
            child: Text(snapshot.data.toString()),
            //  CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
