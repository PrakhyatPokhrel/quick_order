// import 'package:flutter/material.dart';
// import 'package:quick_order/constant/apptheme.dart';
// import 'package:quick_order/constant/color.dart';
// import 'package:quick_order/custom/custom_widget.dart';

// class ManufacturerRegister extends StatefulWidget {
//   const ManufacturerRegister({super.key});

//   @override
//   State<ManufacturerRegister> createState() => _ManufacturerRegisterState();
// }

// class _ManufacturerRegisterState extends State<ManufacturerRegister> {
//   TextEditingController companyname = TextEditingController();

//   TextEditingController address = TextEditingController();

//   TextEditingController contact = TextEditingController();

//   // TextEditingController companyname = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.all(20),
//           child: Column(children: [
//             SizedBox(
//               height: 100,
//             ),
//             Column(
//               children: [
//                 Container(
//                     alignment: Alignment.topLeft,
//                     child: CustomText(
//                         text: "Company Name",
//                         color: AppColor.kOrangeColor,
//                         fontsize: fontSize1)),
//                 CustomTextFormField(
//                   textEditingController: companyname,
//                   hintTextStyle: TextStyle(fontSize: fontSize1),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Container(
//                     alignment: Alignment.topLeft,
//                     child: CustomText(
//                         text: "Company Name",
//                         color: AppColor.kOrangeColor,
//                         fontsize: fontSize1)),
//                 CustomTextFormField(
//                   textEditingController: companyname,
//                   hintTextStyle: TextStyle(fontSize: fontSize1),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Container(
//                     alignment: Alignment.topLeft,
//                     child: CustomText(
//                         text: "Company Name",
//                         color: AppColor.kOrangeColor,
//                         fontsize: fontSize1)),
//                 CustomTextFormField(
//                   textEditingController: companyname,
//                   hintTextStyle: TextStyle(fontSize: fontSize1),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Container(
//                     alignment: Alignment.topLeft,
//                     child: CustomText(
//                         text: "Company Name",
//                         color: AppColor.kOrangeColor,
//                         fontsize: fontSize1)),
//                 CustomTextFormField(
//                   textEditingController: companyname,
//                   hintTextStyle: TextStyle(fontSize: fontSize1),
//                 ),
//               ],
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';
import 'package:quick_order/presentation/manufacturer/add_items.dart';

class ManufacturerRegister extends StatefulWidget {
  const ManufacturerRegister({Key? key}) : super(key: key);

  @override
  State<ManufacturerRegister> createState() => _ManufacturerRegisterState();
}

class _ManufacturerRegisterState extends State<ManufacturerRegister> {
  TextEditingController companyName = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController contact = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController panVat = TextEditingController();
  TextEditingController industryType = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(padding, 50, padding, 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: "Register your company",
                  fontsize: fontSize4,
                  color: AppColor.kGreenColor,
                ),
              ),
              SizedBox(height: 30),
              Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                        text: "Company Name",
                        color: AppColor.kGreenColor,
                        fontsize: fontSize2)),
                CustomTextFormField(
                  textEditingController: companyName,
                  hintTextStyle: TextStyle(fontSize: fontSize2),
                ),
              ]),
              SizedBox(height: 30),
              Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                        text: "Address",
                        color: AppColor.kGreenColor,
                        fontsize: fontSize2)),
                CustomTextFormField(
                  textEditingController: address,
                  hintTextStyle: TextStyle(fontSize: fontSize1),
                ),
              ]),
              SizedBox(height: 30),
              Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                        text: "Industry Type",
                        color: AppColor.kGreenColor,
                        fontsize: fontSize2)),
                CustomTextFormField(
                  textEditingController: industryType,
                  hintTextStyle: TextStyle(fontSize: fontSize2),
                ),
              ]),
              SizedBox(height: 30),
              Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                        text: "Contact Number",
                        color: AppColor.kGreenColor,
                        fontsize: fontSize2)),
                CustomTextFormField(
                  textEditingController: contact,
                  hintTextStyle: TextStyle(fontSize: fontSize2),
                ),
              ]),
              SizedBox(height: 30),
              Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                        text: "Email Address",
                        color: AppColor.kGreenColor,
                        fontsize: fontSize2)),
                CustomTextFormField(
                  textEditingController: email,
                  hintTextStyle: TextStyle(fontSize: fontSize1),
                ),
              ]),
              SizedBox(height: 30),
              Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                          text: "VAT/PAN Number",
                          color: AppColor.kGreenColor,
                          fontsize: fontSize2)),
                  CustomTextFormField(
                    textEditingController: panVat,
                    hintTextStyle: TextStyle(fontSize: fontSize1),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((context) => AddProductPage())));
                },
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: AppColor.kOrangeColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: CustomText(
                          text: "Register",
                          color: AppColor.white,
                          fontsize: fontSize2),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
