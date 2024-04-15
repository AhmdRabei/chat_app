// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/widgets/custom_botton_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<LoginView> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  kLogo,
                  height: 100,
                  width: 100,
                ),
                const Text(
                  'Mario Chat',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 5),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontSize: 25,
                    ),
                  ),
                ),
                TextFieldWidget(
                  obScureText: false,
                  validatorText: 'wrong value try enter a validate account',
                  onChange: (data) {
                    email = data;
                  },
                  label: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  obScureText: true,
                  validatorText: 'wrong value try enter an password',
                  onChange: (data) {
                    password = data;
                  },
                  label: 'Password',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButtonWidget(
                  buttonTitle: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await userSignin();
                        Navigator.pushNamed(context, ChatView.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context, 'user password');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context, 'email in used try again');
                        }
                      } catch (e) {
                        showSnackBar(
                            context, 'there was an error try again later');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an account ? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterView.id);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 154, 210, 255),
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userSignin() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
