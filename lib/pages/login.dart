import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/AuthService/auth_service.dart';
import 'package:shopping_app/pages/validation.dart';

import '../constants/constant.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _nameCont = TextEditingController();
  final _emailCont = TextEditingController();
  final _passCont = TextEditingController();
  final _mobileCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailCont,
                      validator: ErrorHandling().emailValidation,
                      decoration:
                          Strings.textField.copyWith(labelText: 'Email'),
                    ),
                    Strings().sizeHeight,
                    Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                    TextFormField(
                      controller: _passCont,
                      validator: ErrorHandling().passwordValidation,
                      decoration:
                          Strings.textField.copyWith(labelText: 'Password'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    _login(),
                  ],
                ),
              ))),
    );
  }

  _login() {
    return Material(
      color: Colors.tealAccent,
      borderRadius: BorderRadius.circular(20),
      child: Center(
        child: TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  await AuthService().signIn(_emailCont.text, _passCont.text);
                  Get.to(const HomeScreen());
                  errorMessage = '';
                } on FirebaseAuthException catch (e) {
                  print(e.message);
                  errorMessage = e.message!;
                }
                
              }
              setState(() {});
            },
            child: Text('Login')),
      ),
    );
  }
}
