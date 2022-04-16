import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/AuthService/auth_service.dart';
import 'package:shopping_app/constants/constant.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/pages/validation.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                      controller: _nameCont,
                      validator: ErrorHandling().nameValidation,
                      decoration: Strings.textField.copyWith(labelText: 'Name'),
                    ),
                    Strings().sizeHeight,
                    TextFormField(
                      controller: _emailCont,
                      validator: ErrorHandling().emailValidation,
                      decoration:
                          Strings.textField.copyWith(labelText: 'Email'),
                    ),
                    
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
                    Strings().sizeHeight,
                    TextFormField(
                      controller: _mobileCont,
                      validator: ErrorHandling().mobileValidation,
                      decoration:
                          Strings.textField.copyWith(labelText: 'Mobile'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                   
                    _submit(),
                    const SizedBox(
                      height: 40,
                    ),
                    _alreadyHaveAnAccount(),
                  ],
                ),
              ))),
    );
  }

  _submit() {
    return Material(
      color: Colors.tealAccent,
      borderRadius: BorderRadius.circular(20),
      child: Center(
        child: TextButton(
            onPressed: () async{
              if (_formKey.currentState!.validate()) {
                try {
                  await AuthService().register(_nameCont.text, _passCont.text,
                      _mobileCont.text, _emailCont.text);
                  await AuthService().createUser(_emailCont.text, _passCont.text);
                  Get.to(const Login());
                  errorMessage = '';
                } on FirebaseAuthException catch (e) {
                  errorMessage = e.message!;
                }
                
              }
              setState(() {});
            },
            child: Text('Submit')),
      ),
    );
  }

  _alreadyHaveAnAccount() {
    return TextButton(
        onPressed: () {
          Get.to(const Login());
        },
        child: const Text('Already Have An Account?'));
  }
}