import 'package:flutter/material.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  TextEditingController size = TextEditingController();
  TextEditingController material = TextEditingController();
  TextEditingController color = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(text: "Detail of product", context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
                textEditingController: size, borderColor: AppColor.kGreenColor),

            CustomTextFormField(
                textEditingController: material,
                borderColor: AppColor.kGreenColor),

            CustomTextFormField(
                textEditingController: color,
                borderColor: AppColor.kGreenColor),

            // CustomTextFormField(textEditingController: textEditingController, borderColor: borderColor),

            // CustomTextFormField(textEditingController: textEditingController, borderColor: borderColor),
          ],
        ),
      ),
    );
  }
}
