import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/bloc/bloc/home_bloc.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/bloc/bloc/home_event.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/bloc/bloc/home_state.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/item_description.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeProductBloc>().add(FetchApIEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: "Categories",
                      color: AppColor.darkgrey,
                      fontsize: fontSize3),
                  CustomText(
                      text: "See all>",
                      color: AppColor.darkgrey,
                      fontsize: fontSize1),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.72,
              width: double.infinity,
              child: ContainedTabBarView(
                onChange: (value) {
                  if (value == 0) {
                    context.read<HomeProductBloc>().add(FetchApIEvent());
                  }
                  if (value == 1) {
                    context
                        .read<HomeProductBloc>()
                        .add(FetchApiCatalogueEvent());
                  }
                },
                tabs: [
                  CustomChip(
                    text: "Bed",
                    icon: Icons.bed_outlined,
                  ),
                  CustomChip(
                    text: "Sofa",
                    icon: Icons.chair,
                  ),
                  CustomChip(
                    text: "Chair",
                    icon: Icons.chair_alt_outlined,
                  ),
                  CustomChip(
                    text: "Table",
                    icon: Icons.table_bar_outlined,
                  ),
                  CustomChip(
                    text: "Door",
                    icon: Icons.door_back_door,
                  ),
                  CustomChip(
                    text: "Door",
                    icon: Icons.door_back_door,
                  ),
                ],
                tabBarProperties: const TabBarProperties(
                  isScrollable: true,
                  height: 125,
                  indicatorColor: AppColor.kOrangeColor,
                  indicatorWeight: 1,
                  unselectedLabelColor: Colors.black,
                ),
                views: [
                  BlocConsumer<HomeProductBloc, HomeProductState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is LoadingHomeProductState) {
                        return Container(
                          height: 20,
                          width: 100,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        );
                      }
                      if (state is SuccessHomeProductState) {
                        return Container(
                            child: SingleChildScrollView(
                                child: Padding(
                          padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            height: MediaQuery.of(context).size.height * 0.58,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 2.0,
                                mainAxisSpacing: 6.0,
                              ),
                              itemCount: state.product[0].products.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  color: AppColor.grey[200],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ItemDescription(state
                                                          .product[0]
                                                          .products[index])));
                                        },
                                        child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Image(
                                              fit: BoxFit.fitHeight,
                                              image: NetworkImage(state
                                                  .product[0]
                                                  .products[index]
                                                  .images[0]
                                                  .toString())),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: CustomText(
                                            text: state.product[0]
                                                .products[index].description,
                                            color: AppColor.darkgrey,
                                            fontsize: fontSize1),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            3, 0, padding, 1),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                                text: "Price: " +
                                                    state.product[0]
                                                        .products[index].price
                                                        .toString(),
                                                color: AppColor.grey,
                                                fontsize: fontSize1),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.spaceBetween,
                                            //   children: [
                                            //     Icon(Icons
                                            //         .favorite_outline_rounded),
                                            //     Icon(Icons.shopping_cart),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: CustomText(
                                            text: "Rating: " +
                                                state.product[0].products[index]
                                                    .rating
                                                    .toString(),
                                            color: AppColor.kOrangeColor,
                                            fontsize: fontSize1),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )));
                      }
                      return Container(
                        height: 20,
                        width: 100,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      );
                    },
                  ),
                  // BlocConsumer<HomeProductBloc, HomeProductState>(
                  //   listener: (context, state) {},
                  //   builder: (context, state) {
                  //     if (state is LoadingHomeProductState) {
                  //       return Container(
                  //         height: 20,
                  //         width: 100,
                  //         alignment: Alignment.center,
                  //         child: CircularProgressIndicator(
                  //           strokeWidth: 1,
                  //         ),
                  //       );
                  //     }
                  //     if (state is SuccessCatalougeState) {
                  //       return Container(
                  //           child: SingleChildScrollView(
                  //               child: Padding(
                  //         padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20)),
                  //           height: MediaQuery.of(context).size.height * 0.58,
                  //           child: GridView.builder(
                  //             gridDelegate:
                  //                 SliverGridDelegateWithFixedCrossAxisCount(
                  //               crossAxisCount: 2,
                  //               crossAxisSpacing: 2.0,
                  //               mainAxisSpacing: 6.0,
                  //             ),
                  //             itemCount: state.data.length,
                  //             itemBuilder: (BuildContext context, int index) {
                  //               return Card(
                  //                 color: AppColor.grey[200],
                  //                 child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: [
                  //                     GestureDetector(
                  //                       onTap: () {
                  //                         // Navigator.push(
                  //                         //     context,
                  //                         //     MaterialPageRoute(
                  //                         //         builder: (context) =>
                  //                         //             ItemDescription()));
                  //                       },
                  //                       child: Container(
                  //                         height: 100,
                  //                         decoration: BoxDecoration(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(20)),
                  //                         child: Image(
                  //                             fit: BoxFit.fitHeight,
                  //                             image: NetworkImage(state
                  //                                 .data[index].photoUrl
                  //                                 .toString())),
                  //                       ),
                  //                     ),
                  //                     Padding(
                  //                       padding:
                  //                           EdgeInsets.fromLTRB(3, 0, 4, 0),
                  //                       child: CustomText(
                  //                           text:
                  //                               "Detail of the furniture dhhdh hsh yss hbsb hshhs",
                  //                           color: AppColor.darkgrey,
                  //                           fontsize: fontSize1),
                  //                     ),
                  //                     Padding(
                  //                       padding: EdgeInsets.fromLTRB(
                  //                           3, 0, padding, 1),
                  //                       child: Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceBetween,
                  //                         children: [
                  //                           CustomText(
                  //                               text: "Price",
                  //                               color: AppColor.grey,
                  //                               fontsize: fontSize1),
                  //                           // Row(
                  //                           //   mainAxisAlignment:
                  //                           //       MainAxisAlignment.spaceBetween,
                  //                           //   children: [
                  //                           //     Icon(Icons
                  //                           //         .favorite_outline_rounded),
                  //                           //     Icon(Icons.shopping_cart),
                  //                           //   ],
                  //                           // ),
                  //                         ],
                  //                       ),
                  //                     )
                  //                   ],
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       )));
                  //     }
                  //     return Container(
                  //         height: 20,
                  //         color: AppColor.grey,
                  //         width: 100,
                  //         alignment: Alignment.center,
                  //         child: Text("Error Loading Data"));
                  //   },
                  // ),
                  Container(
                    child: CustomSingleChildGridView(),
                  ),
                  Container(
                    child: CustomSingleChildGridView(),
                  ),
                  Container(
                    child: CustomSingleChildGridView(),
                  ),
                  Container(
                    child: CustomSingleChildGridView(),
                  ),
                  Container(
                    child: CustomSingleChildGridView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class CustomChip extends StatelessWidget {
  final String text;
  final IconData icon;
  final double padding;

  const CustomChip({
    Key? key,
    required this.text,
    required this.icon,
    this.padding = 15.0, // Default padding value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColor.white,
          child: Icon(
            icon,
            color: AppColor.kGreenColor,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          text,
          style: TextStyle(color: AppColor.kOrangeColor),
        ),
      ],
    );
  }
}

class CustomSingleChildGridView extends StatelessWidget {
  const CustomSingleChildGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        height: MediaQuery.of(context).size.height * 0.58,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 6.0,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: AppColor.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ItemDescription()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://th.bing.com/th?id=OIP.phL1-kuxdG9wXnVb_9fn_wHaE5&w=307&h=203&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2")),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3, 0, padding, 0),
                    child: CustomText(
                        text:
                            "Detail of the furniture dhhdh hsh yss hbsb hshhs",
                        color: AppColor.darkgrey,
                        fontsize: fontSize1),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3, 0, padding, 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: "Price",
                            color: AppColor.grey,
                            fontsize: fontSize1),
                        Icon(Icons.favorite_outline_rounded)
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
