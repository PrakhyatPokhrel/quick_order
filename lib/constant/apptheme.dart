import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_order/constant/color.dart';

double defaultpadding = 16.0;
double borderRadius = 10.0;
double height = 65.0;
double padding = 15.0;
double sizedboxheight = 30.0;
double sizedboxwidth = 10.0;
double sizedboxwidthMid = 20.0;
double fontSize1 = 16;
double fontSize2 = 18.0;
double fontSize3 = 20.0;
double fontSize4 = 23.0;

class AppTheme {
  static ThemeData theme = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(const TextTheme(
    titleLarge: TextStyle(
        color: AppColor.grey, fontSize: 25, fontWeight: FontWeight.w500),
    headlineLarge: TextStyle(
        color: AppColor.kGreenColor, fontSize: 30, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        color: AppColor.kGreenColor, fontSize: 20, fontWeight: FontWeight.w300),
    displayMedium: TextStyle(
        color: AppColor.darkgrey, fontSize: 18, fontWeight: FontWeight.w300),
    headlineSmall: TextStyle(
        color: AppColor.kGreenColor, fontSize: 25, fontWeight: FontWeight.w600),
    displaySmall: TextStyle(
        color: AppColor.kGreenColor, fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(
        color: AppColor.kGreenColor, fontSize: 20, fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(
        color: AppColor.white, fontSize: 15, fontWeight: FontWeight.w600),
  )));
}
