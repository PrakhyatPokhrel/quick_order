import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/bloc/bloc/home_bloc.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/payement_page.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.background,
        child: (context.read<HomeProductBloc>().receiveCartProduct.isEmpty)
            ? Container(
                child: Text("Your cart is empty."),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: context
                          .read<HomeProductBloc>()
                          .receiveCartProduct
                          .length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.17,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      color: AppColor.grey,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Container(
                                        height: double.infinity,
                                        color: AppColor.grey,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        child: Text("")),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                                color: AppColor.darkgrey),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {},
                                                child: Icon(Icons.add)),
                                            Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: AppColor.background),
                                                child: Center(
                                                    child: Text(
                                                  "4",
                                                  style: TextStyle(
                                                      color: AppColor
                                                          .kOrangeColor),
                                                ))),
                                            GestureDetector(
                                                onTap: () {},
                                                child: Icon(Icons.remove))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PayementPage())));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(color: AppColor.grey),
                      child: Center(child: Text("Checkout")),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
