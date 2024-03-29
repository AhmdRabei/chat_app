import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/widgets/custom_botton_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  static String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                  'assets/images/mario.png',
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
                    'Register',
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
                  buttonTitle: 'Register',
                  onTap: () async {
                    // Navigator.pop(context);
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        Navigator.pushNamed(context, ChatView.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context, 'week password');
                        } else if (e.code == 'email-already-in-use') {
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
                      'already have an account ? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 154, 210, 255),
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
