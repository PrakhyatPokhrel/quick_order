import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';
import 'package:quick_order/registration/sign_in_with_google.dart';
import 'package:quick_order/registration/sign_up%20.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<void> signUpWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('Error occurred during sign-up: ${e.message}');
      }
    } catch (e) {
      print('Error occurred during sign-up: $e');
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
                    text: "Welcome back",
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
                  signUpWithEmailAndPassword();
                  print("success");
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
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 140,
                      height: 0.6,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                        text: "or",
                        color: AppColor.darkgrey,
                        fontsize: fontSize1),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 140,
                      height: 0.6,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyWidget()));
                          },
                          child: Image.asset('assets/googlelogo.png')),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signUp()));
                        },
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 42,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.06,
              //   width: MediaQuery.of(context).size.width * 0.85,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       border:
              //           Border.all(color: Color.fromARGB(255, 240, 187, 141))),
              //   child: Center(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         Image.asset('assets/googlelogo.png'),
              //         CustomText(
              //             text: "Continue with Google ",
              //             color: AppColor.darkgrey,
              //             fontsize: fontSize2),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.06,
              //   width: MediaQuery.of(context).size.width * 0.85,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       border:
              //           Border.all(color: Color.fromARGB(255, 240, 187, 141))),
              //   child: Center(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         Icon(
              //           Icons.facebook,
              //           color: Colors.blue,
              //           size: 35,
              //         ),
              //         CustomText(
              //             text: "Continue with Facebook ",
              //             color: AppColor.darkgrey,
              //             fontsize: fontSize2),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
