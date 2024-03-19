import 'package:flutter/material.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';

class CustomSizedBox extends StatelessWidget {
  final String text;
  final VoidCallback? onTapCallback;
  const CustomSizedBox({
    super.key,
    required this.text,
    this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kOrangeColor),
            onPressed: onTapCallback ?? () {},
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            )));
  }
}

class CustomMidContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTapCallback;

  const CustomMidContainer({
    super.key,
    required this.icon,
    required this.text,
    this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapCallback ?? () {},
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.kGreenColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Icon(
              icon,
              size: 50,
              color: AppColor.kOrangeColor,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(color: AppColor.black),
        )
      ],
    );
  }
}

class CustomButtomNavTab extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTapCallBack;
  const CustomButtomNavTab({
    super.key,
    required this.text,
    required this.icon,
    this.onTapCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallBack ?? () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: AppColor.kGreenColor,
          ),
          Text(text,
              style: TextStyle(
                color: AppColor.black,
              ))
        ],
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget implements PreferredSize {
  final String text;
  final BuildContext context;
  const CustomAppbar({
    super.key,
    required this.text,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Widget get child =>
      //  Container(
      //       // height: 100,
      //       width: double.infinity,
      //       child: Center(
      //         child: Text(
      //           "Catalouge",
      //           style: TextStyle(color: AppColor.kGreenColor),
      //         ),
      //       ),
      //     );
      AppBar(
        title: Text(text, style: AppTheme.theme.textTheme.bodyLarge),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.kGreenColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.kGreenColor,
        // automaticallyImplyLeading: true,
        centerTitle: true,
      );

  @override
  Size get preferredSize => Size(200, 60);
}

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;

  const CustomText(
      {super.key,
      required this.text,
      required this.color,
      this.fontWeight,
      required this.fontsize,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      softWrap: false,
      style: TextStyle(
          decoration: textDecoration,
          color: color,
          fontWeight: fontWeight ?? FontWeight.w100,
          fontSize: fontsize),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.textEditingController,
    this.hinttext,
    this.labeltext,
    this.iconData,
    this.borderColor,
    this.obscuretext,
    this.hintTextStyle,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String? hinttext;
  final String? labeltext;
  final IconData? iconData;
  final Color? borderColor;
  final bool? obscuretext;
  final TextStyle? hintTextStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(color: AppColor.kGreenColor, fontSize: fontSize0),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor ?? AppColor.kGreenColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor ?? AppColor.kOrangeColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor ?? AppColor.kGreenColor),
          ),
          hintText: hinttext,
          labelText: labeltext,
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Icon(iconData),
          ),
          labelStyle:
              TextStyle(color: AppColor.kGreenColor, fontSize: fontSize3),
          hintStyle: TextStyle(color: AppColor.darkgrey)),
    );
  }
}
