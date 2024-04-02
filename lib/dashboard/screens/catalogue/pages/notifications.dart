import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:quick_order/payement/khalti.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextButton(
            onPressed: () async {
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
            child: const Text("pay")));
  }
}
