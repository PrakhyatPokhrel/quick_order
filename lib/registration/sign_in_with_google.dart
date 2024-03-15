import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';
import 'package:quick_order/registration/sign_up%20.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      print('User signed in: ${userCredential.user!.email}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        print('Invalid email or password.');
      } else {
        print('Error occurred during sign-in: ${e.message}');
      }
    } catch (e) {
      print('Error occurred during sign-in: $e');
    }
  }

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
                height: 130,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: CustomText(
                    text: "Login with Google",
                    color: AppColor.kGreenColor,
                    fontsize: fontSize4),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                textEditingController: email,
                borderColor: AppColor.darkgrey,
                hinttext: "Enter your email",
                labeltext: "Email",
                obscuretext: false,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                textEditingController: password,
                borderColor: AppColor.darkgrey,
                hinttext: "Enter your password",
                labeltext: "Password",
                obscuretext: true,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                        ),
                        CustomText(
                            text: "Forgot password?",
                            color: AppColor.grey,
                            fontsize: fontSize1),
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  signInWithGoogle(context);
                },
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        color: AppColor.kOrangeColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: CustomText(
                          text: "Login",
                          color: AppColor.white,
                          fontsize: fontSize3),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: "Don't have an account? /  ",
                          color: AppColor.kGreenColor,
                          fontsize: fontSize1),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signUp()));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.background,
                              ),
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: Center(
                                child: CustomText(
                                    text: "SignUp",
                                    color: AppColor.kGreenColor,
                                    fontsize: fontSize2),
                              )))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
