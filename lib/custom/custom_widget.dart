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
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kOrangeColor),
            onPressed: onTapCallback ?? () {},
            child: Text(
              text,
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
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

  const CustomText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      softWrap: false,
      style: TextStyle(
          color: color, fontWeight: FontWeight.w500, fontSize: fontsize),
    );
  }
}
