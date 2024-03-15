import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/bloc/bloc/home_bloc.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView.builder(
                itemCount: context
                    .read<HomeProductBloc>()
                    .receiveFavouriteProducts
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          color: AppColor.grey,
                          width: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          height: double.infinity,
                          color: AppColor.grey,
                          width: MediaQuery.of(context).size.height * 0.15,
                          child: Center(child: Text("Image")),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Favourites",
                                style: TextStyle(color: AppColor.darkgrey),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                })));
  }
}
