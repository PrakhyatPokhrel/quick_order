// import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
// import 'package:flutter/material.dart';
// import 'package:quick_order/constant/apptheme.dart';
// import 'package:quick_order/constant/color.dart';
// import 'package:quick_order/custom/custom_widget.dart';
// import 'package:quick_order/dashboard/screens/catalogue/navigate_to/cart.dart';

// class HomeTry extends StatefulWidget {
//   const HomeTry({super.key});

//   @override
//   State<HomeTry> createState() => _HomeTryState();
// }

// class _HomeTryState extends State<HomeTry> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 600,
//         width: 800,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                       text: "Categories",
//                       color: AppColor.darkgrey,
//                       fontsize: fontSize3),
//                   CustomText(
//                       text: "See all>",
//                       color: AppColor.darkgrey,
//                       fontsize: fontSize1),
//                 ],
//               ),
//               Container(
//                 height: 600,
//                 width: 600,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ContainedTabBarView(
//                     initialIndex: 0,
//                     onChange: (value) {},
//                     tabs: const [
//                       CustomChip(
//                         text: "Bed",
//                         icon: Icons.bed_outlined,
//                       ),
//                       CustomChip(
//                         text: "Bed",
//                         icon: Icons.bed_outlined,
//                       ),
//                       CustomChip(
//                         text: "Sofa",
//                         icon: Icons.chair,
//                       ),
//                       CustomChip(
//                         text: "Chair",
//                         icon: Icons.chair_alt_outlined,
//                       ),
//                       CustomChip(
//                         text: "Table",
//                         icon: Icons.table_bar_outlined,
//                       ),
//                       CustomChip(
//                         text: "Door",
//                         icon: Icons.door_back_door,
//                       ),
//                     ],
//                     tabBarProperties: const TabBarProperties(
//                       height: 125,
//                       isScrollable: true,
//                       indicatorColor: Colors.red,
//                       indicatorWeight: 1,
//                       unselectedLabelColor: Colors.black,
//                     ),
//                     views: [
//                       CustomSingleChildGridView(),
//                       CustomSingleChildGridView(),
//                       CustomSingleChildGridView(),
//                       CustomSingleChildGridView(),
//                       CustomSingleChildGridView(),
//                       CustomSingleChildGridView(),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
