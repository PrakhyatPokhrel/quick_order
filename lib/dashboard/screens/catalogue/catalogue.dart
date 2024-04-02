import 'package:flutter/material.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/custom/custom_widget.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/cart/cart.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/favourites/favourite.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/home/home.dart';
import 'package:quick_order/dashboard/screens/catalogue/pages/notifications.dart';
import 'package:quick_order/registration/manufacturer_register.dart';
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
      drawer: Drawer(
        backgroundColor: AppColor.background,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              // DrawerHeader(child: ),
              ListTile(
                  leading: Icon(Icons.person),
                  title: CustomText(
                      text: "Profile",
                      color: AppColor.darkgrey,
                      fontsize: fontSize2)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ManufacturerRegister())));
                },
                child: ListTile(
                    leading: Icon(Icons.app_registration_rounded),
                    title: CustomText(
                        text: "Register Company",
                        color: AppColor.darkgrey,
                        fontsize: fontSize2)),
              ),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: CustomText(
                      text: "Settings",
                      color: AppColor.darkgrey,
                      fontsize: fontSize2)),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: CustomText(
                      text: "Logout",
                      color: AppColor.darkgrey,
                      fontsize: fontSize2))
            ],
          ),
        ),
      ),
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
      automaticallyImplyLeading: false,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: CircleAvatar(child: const Icon(Icons.person)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        Container(
          height: 40,
          width: 315,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.background),
          child: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            controller: searchText,
            decoration: InputDecoration(
                hintText: 'Search',
                // contentPadding: EdgeInsets.symmetric(horizontal: 30),
                border: InputBorder.none,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                )),
          ),
        ),
      ],
    );
  }
}
