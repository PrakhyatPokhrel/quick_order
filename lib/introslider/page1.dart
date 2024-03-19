// import 'package:flutter/material.dart';
// import 'package:intro_slider/intro_slider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Intro Slider with Checkbox Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: IntroSliderPage(),
//     );
//   }
// }

// class IntroSliderPage extends StatefulWidget {
//   @override
//   _IntroSliderPageState createState() => _IntroSliderPageState();
// }

// class _IntroSliderPageState extends State<IntroSliderPage> {
//   bool agreementChecked = false;

//   List<Slide> slides = [
//     Slide(
//       title: "Welcome to Our App!",
//       description: "Discover amazing features.",
//       backgroundColor: Colors.blue,
//     ),
//     Slide(
//       title: "Explore",
//       description: "Explore our products and services.",
//       backgroundColor: Colors.green,
//     ),
//     Slide(
//       title: "Get Started!",
//       description: "Start using our app today.",
//       backgroundColor: Colors.orange,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Intro Slider with Checkbox"),
//       ),
//       body: IntroSlider(
//         slides: slides,
//         onDonePress: () {
//           if (agreementChecked) {
//             // Navigate to the next screen or perform any action
//             print("User agreed and done.");
//           } else {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text("Agreement Required"),
//                   content: Text("Please agree to the terms before proceeding."),
//                   actions: [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text("OK"),
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         },
//         onSkipPress: () {
//           // Handle skip action if needed
//           print("User skipped the intro.");
//         },
//       ),
//       bottomNavigationBar: CheckboxListTile(
//         title: Text("I agree to the terms and conditions"),
//         value: agreementChecked,
//         onChanged: (value) {
//           setState(() {
//             agreementChecked = value!;
//           });
//         },
//       ),
//     );
//   }
// }
