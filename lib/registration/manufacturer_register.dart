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
import 'package:quick_order/textformfielddata.dart';

class ManufacturerRegister extends StatefulWidget {
  const ManufacturerRegister({Key? key}) : super(key: key);

  @override
  State<ManufacturerRegister> createState() => _ManufacturerRegisterState();
}

class _ManufacturerRegisterState extends State<ManufacturerRegister> {
  TextEditingController email = TextEditingController();

  // TextEditingController email = TextEditingController();

  // TextEditingController email = TextEditingController();

  // TextEditingController email = TextEditingController();
  final List<TextFormFieldData> fields = [
    TextFormFieldData(
        label: "Company Name", controller: TextEditingController()),
    TextFormFieldData(label: "Address", controller: TextEditingController()),
    TextFormFieldData(label: "Contact", controller: TextEditingController()),
    // Add more fields as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(padding, 50, padding, 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: "Register your company",
                  fontsize: fontSize4,
                  color: AppColor.kGreenColor,
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: fields
                    .map(
                      (field) => Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              text: field.label,
                              color: AppColor.kGreenColor,
                              fontsize: fontSize2,
                            ),
                          ),
                          CustomTextFormField(
                            textEditingController: field.controller,
                            // hintTextStyle: TextStyle(fontSize: fontSize1),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
