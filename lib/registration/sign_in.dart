import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';
import 'package:quick_order/dashboard/screens/catalogue/catalogue.dart';
import 'package:quick_order/registration/sign_in_with_google.dart';
import 'package:quick_order/registration/sign_up%20.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
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

  final GoogleSigning googleSignIn = const GoogleSigning();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                      text: "Welcome back",
                      color: AppColor.kGreenColor,
                      fontsize: fontSize4),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                          text: "Email Address",
                          color: AppColor.kGreenColor,
                          fontsize: fontSize1)),
                  CustomTextFormField(
                    textEditingController: email,
                    hintTextStyle: TextStyle(fontSize: fontSize1),
                  ),
                ]),
                const SizedBox(height: 30),
                Column(children: [
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
                ]),
                const SizedBox(height: 30),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 150,
                          ),
                          CustomText(
                              text: "Forgot password?",
                              color: AppColor.grey,
                              fontsize: fontSize1),
                        ],
                      ),
                      const Divider()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    signUpWithEmailAndPassword();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Catalogue())));
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
                const SizedBox(
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
                            text: "Don't have an account? /",
                            color: AppColor.kGreenColor,
                            fontsize: fontSize1),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const signUp()));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: AppColor.kOrangeColor,
                                ),
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: Center(
                                  child: CustomText(
                                      text: "SignUp",
                                      textDecoration: TextDecoration.underline,
                                      color: AppColor.kGreenColor,
                                      fontsize: fontSize2),
                                )))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 140,
                        height: 0.6,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomText(
                          text: "or",
                          color: AppColor.darkgrey,
                          fontsize: fontSize1),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 140,
                        height: 0.6,
                        color: Colors.black,
                      ),
                      const SizedBox(
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
                            onTap: () {},
                            child: Image.asset('assets/googlelogo.png')),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GoogleSigning()));
                          },
                          child: const Icon(
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
      ),
    );
  }
}
