import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';
import 'package:quick_order/payement/esewa.dart';
import 'package:quick_order/payement/khalti.dart';

class PayementPage extends StatefulWidget {
  const PayementPage({super.key});

  @override
  State<PayementPage> createState() => _PayementPageState();
}

class _PayementPageState extends State<PayementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(text: "Choose Payment Method", context: context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Esewa esewa = Esewa();
              esewa.pay();
            },
            child: Container(
              alignment: Alignment.topCenter,
              height: 50,
              width: 200,
              decoration: const BoxDecoration(color: AppColor.kOrangeColor),
              child: const Center(child: Text("Esewa")),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              await KhaltiScope.of(context).pay(
                config: config,
                preferences: [
                  // PaymentPreference.connectIPS,
                  // PaymentPreference.eBanking,
                  // PaymentPreference.sct,
                  PaymentPreference.khalti
                ],
                onSuccess: (successModel) {
                  // log(successModel.productName.toString(), name: "success model");
                  // debugPrint("Successful");
                  print("Succesful");
                },
                onFailure: (failureModel) {
                  log(failureModel.toString(), name: "failure model");
                  debugPrint("Failed");
                },
                onCancel: () {
                  log("cancelele", name: "success model");
                  debugPrint("Cancelled");
                },
              );
            },
            child: Container(
              alignment: Alignment.topCenter,
              height: 50,
              width: 200,
              decoration: const BoxDecoration(color: AppColor.kOrangeColor),
              child: const Center(child: Text("Khalti")),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.topCenter,
              height: 50,
              width: 200,
              decoration: const BoxDecoration(color: AppColor.kOrangeColor),
              child: const Center(child: Text("COD")),
            ),
          ),
        ]),
      ),
    );
  }
}
