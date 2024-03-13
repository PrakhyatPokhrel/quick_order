import 'package:flutter/material.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/cart.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/favourite.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/home/home.dart';
import 'package:quick_order/dashboard/screens/catalogue/navigate_to/notifications.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({Key? key}) : super(key: key);

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  List navlist = [HomePage(), Cart(), Favourite(), Notifications()];
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kGreenColor,
      appBar: AppBars(),
      body: navlist[selectedindex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: AppColor.kGreenColor,
        ),
        child: SalomonBottomBar(
          currentIndex: selectedindex,
          selectedItemColor: AppColor.white,
          unselectedItemColor: AppColor.darkgrey,
          onTap: (value) {
            selectedindex = value;
            setState(() {});
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: AppColor.white,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: const Text("Cart"),
              selectedColor: AppColor.white,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Favourite"),
              selectedColor: AppColor.white,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.notifications),
              title: const Text("Notification"),
              selectedColor: AppColor.white,
            ),
          ],
        ),
      ),
    );
  }
}

class AppBars extends StatelessWidget implements PreferredSize {
  const AppBars({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.kGreenColor,
      actions: [
        Container(
          padding:
              const EdgeInsets.only(top: 5, bottom: 0.5, right: 10, left: 10),
          child: SearchBar(),
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class SearchBar extends StatelessWidget {
  TextEditingController searchText = TextEditingController();

  SearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: searchText,
        decoration: InputDecoration(
            hintText: 'Search',
            // contentPadding: EdgeInsets.symmetric(horizontal: 30),
            border: InputBorder.none,
            icon: Padding(
              padding: EdgeInsets.fromLTRB(padding, padding, 0, padding),
              child: Icon(Icons.search),
            )),
      ),
    );
  }
}
