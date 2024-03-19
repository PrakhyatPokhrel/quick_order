import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  Future<void> signUpWithEmailAndPassword() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (password != repassword) {
        print('Error occurred during sign-up: ${e.message}');
      } else {
        print('Error occurred during sign-up: ${e.message}');
      }
    } catch (e) {
      print('Error occurred during sign-up: $e');
    }
  }

  TextEditingController repassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: CustomText(
                    text: "Create an account",
                    color: AppColor.kGreenColor,
                    fontsize: fontSize4),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                          text: "Email",
                          color: AppColor.kGreenColor,
                          fontsize: fontSize1)),
                  CustomTextFormField(
                    textEditingController: email,
                    hintTextStyle: TextStyle(fontSize: fontSize1),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                          text: "Password",
                          color: AppColor.kGreenColor,
                          fontsize: fontSize1)),
                  CustomTextFormField(
                    textEditingController: password,
                    hintTextStyle: TextStyle(fontSize: fontSize1),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                          text: "Confirm Password",
                          color: AppColor.kGreenColor,
                          fontsize: fontSize1)),
                  CustomTextFormField(
                    textEditingController: repassword,
                    hintTextStyle: TextStyle(fontSize: fontSize1),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (onChanged) {}),
                  CustomText(
                      text: "I agree to terms and conditions",
                      color: AppColor.darkgrey,
                      fontsize: fontSize1)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (password.text == repassword.text) {
                    signUpWithEmailAndPassword();
                  } else {}
                  log(" signin failed");
                },
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        color: AppColor.kOrangeColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: CustomText(
                          text: "SignUp",
                          color: AppColor.white,
                          fontsize: fontSize3),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
