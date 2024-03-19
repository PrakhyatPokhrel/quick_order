import 'package:flutter/material.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';
import 'package:quick_order/registration/sign_in.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int? groupValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kOrangeColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        //   child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //     SizedBox(
        //       height: 40,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(15),
        //       child: Center(
        //         child: CustomText(
        //             text: "Login as", color: AppColor.kGreenColor, fontsize: 25),
        //       ),
        //     ),
        //     GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //               context, MaterialPageRoute(builder: (context) => SignIn()));
        //         },
        //         child: Padding(
        //           padding: const EdgeInsets.all(15),
        //           child: Container(
        //               decoration: BoxDecoration(
        //                   color: AppColor.white,
        //                   borderRadius: BorderRadius.circular(30),
        //                   boxShadow: [
        //                     BoxShadow(
        //                       color: Colors.grey.withOpacity(0.8), // Shadow color
        //                       spreadRadius: 1, // Spread radius
        //                       blurRadius: 7, // Blur radius
        //                       offset: Offset(0, 3), // Offset
        //                     ),
        //                   ],
        //                   border: Border.all(color: AppColor.kOrangeColor)),
        //               height: MediaQuery.of(context).size.height * 0.1,
        //               width: double.infinity,
        //               child: Center(
        //                 child: CustomText(
        //                     text: "Customer",
        //                     color: AppColor.kGreenColor,
        //                     fontsize: fontSize3),
        //               )),
        //         )),
        //     GestureDetector(
        //         onTap: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => VendorRegister()));
        //         },
        //         child: Padding(
        //           padding: const EdgeInsets.all(15.0),
        //           child: Container(
        //               decoration: BoxDecoration(
        //                   color: AppColor.white,
        //                   borderRadius: BorderRadius.circular(30),
        //                   boxShadow: [
        //                     BoxShadow(
        //                       color: Colors.grey.withOpacity(0.8), // Shadow color
        //                       spreadRadius: 1, // Spread radius
        //                       blurRadius: 7, // Blur radius
        //                       offset: Offset(0, 3), // Offset
        //                     ),
        //                   ],
        //                   border: Border.all(color: AppColor.kOrangeColor)),
        //               height: MediaQuery.of(context).size.height * 0.1,
        //               width: double.infinity,
        //               child: Center(
        //                 child: CustomText(
        //                     text: "Retailer",
        //                     color: AppColor.kGreenColor,
        //                     fontsize: fontSize3),
        //               )),
        //         )),
        //     GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => ManufacturerRegister()));
        //         },
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Container(
        //               decoration: BoxDecoration(
        //                   color: AppColor.white,
        //                   borderRadius: BorderRadius.circular(30),
        //                   boxShadow: [
        //                     BoxShadow(
        //                       color: Colors.grey.withOpacity(0.8), // Shadow color
        //                       spreadRadius: 1, // Spread radius
        //                       blurRadius: 7, // Blur radius
        //                       offset: Offset(0, 3), // Offset
        //                     ),
        //                   ],
        //                   border: Border.all(color: AppColor.kOrangeColor)),
        //               height: MediaQuery.of(context).size.height * 0.1,
        //               width: double.infinity,
        //               child: Center(
        //                 child: CustomText(
        //                     text: "Manufacturer",
        //                     color: AppColor.kGreenColor,
        //                     fontsize: fontSize3),
        //               )),
        //         )),

        //   ]),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: CustomText(
                    text: "Login as", color: AppColor.white, fontsize: 40)),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: RadioListTile(
                value: false,
                title: Text("Customer"),
                groupValue: groupValue,
                onChanged: (onChanged) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => SignIn())));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: RadioListTile(
                title: Text("Retailer"),
                value: false,
                groupValue: groupValue,
                onChanged: (onChanged) {
                  print("item 1");
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: RadioListTile(
                value: false,
                title: Text("Manufacturer"),
                groupValue: groupValue,
                onChanged: (onChanged) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
