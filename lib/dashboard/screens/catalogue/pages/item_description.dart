import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/cart/cart.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/favourites/favourite.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/home/bloc/bloc/home_bloc.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/home/bloc/bloc/home_event.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/home/model/fakestore_product.dart';

class ItemDescription extends StatefulWidget {
  Product clickedProduct;

  ItemDescription(this.clickedProduct, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<ItemDescription> createState() => _ItemDescriptionState(clickedProduct);
}

class _ItemDescriptionState extends State<ItemDescription> {
  Product clickProducts;

  _ItemDescriptionState(this.clickProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(text: clickProducts.title, context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(clickProducts.images[0].toString())),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: "Rs. ${clickProducts.price}",
                          color: AppColor.kOrangeColor,
                          fontsize: fontSize2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                context.read<HomeProductBloc>().add(
                                    AddToCartClickEvent(
                                        addtocart: clickProducts));

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Cart()));
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(padding, 0, padding, 0),
                                child: const Icon(Icons.shopping_cart),
                              )),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(padding, 0, padding, 0),
                            child: GestureDetector(
                                onTap: () {
                                  // context.read<FavouritesBloc>().add(
                                  //     AddToFavouriteClickEvent(
                                  //         addtofavourite: clickProducts));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Favourite()));
                                },
                                child: const Icon(Icons.favorite_outline_outlined)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Text(
                    "Description : " + (clickProducts.description),
                    style: TextStyle(
                        color: AppColor.darkgrey, fontSize: fontSize1),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
