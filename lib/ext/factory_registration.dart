import 'package:flutter/material.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';

class FactoryRegistration extends StatefulWidget {
  const FactoryRegistration({super.key});

  @override
  State<FactoryRegistration> createState() => _FactoryRegistrationState();
}

class _FactoryRegistrationState extends State<FactoryRegistration> {
  TextEditingController name = TextEditingController();
  TextEditingController estDate = TextEditingController();
  TextEditingController provinence = TextEditingController();
  TextEditingController zone = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(text: "Detail of product", context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
                textEditingController: name, borderColor: AppColor.kGreenColor),

            CustomTextFormField(
                textEditingController: estDate,
                borderColor: AppColor.kGreenColor),

            CustomTextFormField(
                textEditingController: provinence,
                borderColor: AppColor.kGreenColor),

            // CustomTextFormField(textEditingController: textEditingController, borderColor: borderColor),

            // CustomTextFormField(textEditingController: textEditingController, borderColor: borderColor),
          ],
        ),
      ),
    );
  }
}
