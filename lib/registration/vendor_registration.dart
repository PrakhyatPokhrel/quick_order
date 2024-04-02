import 'package:flutter/material.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';

class VendorRegister extends StatefulWidget {
  const VendorRegister({super.key});

  @override
  State<VendorRegister> createState() => _VendorRegisterState();
}

class _VendorRegisterState extends State<VendorRegister> {
  TextEditingController companyName = TextEditingController();

  TextEditingController number = TextEditingController();

  TextEditingController emailAddress = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController vat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                        text: "Company Name",
                        color: AppColor.kOrangeColor,
                        fontsize: fontSize1)),
                CustomTextFormField(
                  textEditingController: companyName,
                  hintTextStyle: TextStyle(fontSize: fontSize1),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                        text: "Contact No.",
                        color: AppColor.kOrangeColor,
                        fontsize: fontSize1)),
                CustomTextFormField(
                  textEditingController: number,
                  hintTextStyle: TextStyle(fontSize: fontSize1),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                        text: "Email Address",
                        color: AppColor.kOrangeColor,
                        fontsize: fontSize1)),
                CustomTextFormField(
                  textEditingController: emailAddress,
                  hintTextStyle: TextStyle(fontSize: fontSize1),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                        text: "VAT/PAN Number",
                        color: AppColor.kOrangeColor,
                        fontsize: fontSize1)),
                CustomTextFormField(
                  textEditingController: vat,
                  hintTextStyle: TextStyle(fontSize: fontSize1),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
