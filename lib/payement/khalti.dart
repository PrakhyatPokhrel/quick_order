import 'package:khalti_flutter/khalti_flutter.dart';

final config = PaymentConfig(
  amount: 10000, // Amount should be in paisa
  productIdentity: 'dell-g5-g5510-2021',
  productName: 'Dell G5 G5510 2021',
  productUrl: 'https://www.khalti.com/#/bazaar',
  returnUrl: 'https://example.com/test',
  additionalData: {
    // Not mandatory; can be used for reporting purpose
    'vendor': 'Khalti Bazaar',
  },
);
// KhaltiButton(
//   config: config,
//   preferences: [ // Not providing this will enable all the payment methods.
//     PaymentPreference.khalti,
//     PaymentPreference.eBanking,
//   ],
//   onSuccess: (successModel) {
//     // Perform Server Verification 
//   },
//   onFailure: (failureModel) {
//     // What to do on failure?
//   },
//   onCancel: () {
//     // User manually cancelled the transaction
//   },
// ),