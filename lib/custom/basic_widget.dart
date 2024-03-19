import 'package:flutter/widgets.dart';
import 'package:quick_order/constant/color.dart';

class CustomTextContainer extends StatelessWidget {
  final String text;
  final double? heightC;
  final double? widthC;
  final Color? color;
  const CustomTextContainer(
    t, {
    super.key,
    required this.text,
    required this.heightC,
    required this.widthC,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: heightC,
      // width: widthC,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.kGreenColor),
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
