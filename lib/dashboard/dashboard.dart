import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quick_order/constant/apptheme.dart';
import 'package:quick_order/constant/color.dart';
import 'package:quick_order/controller/language_change_controller.dart';
import 'package:quick_order/custom/custom_widget.dart';
import 'package:quick_order/dashboard/screens/catalogue/catalogue.dart';
import 'package:quick_order/registration/manufacturer_register.dart';
import 'package:quick_order/registration/sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

enum Language { english, nepali }

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageChangeController>(
      builder: (context, languageController, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.kOrangeColor,
            title: Text(""),
            actions: [
              Consumer<LanguageChangeController>(
                  builder: (context, provider, child) {
                return PopupMenuButton(
                  onSelected: (Language item) {
                    if (item == Language.english) {
                      print(item);
                      provider.changeLanguage(Locale('en'));
                    } else {
                      provider.changeLanguage(Locale('ne'));
                      print(item);
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<Language>>[
                    PopupMenuItem(
                        value: Language.english, child: Text("English")),
                    PopupMenuItem(
                        value: Language.nepali, child: Text("Nepali")),
                  ],
                );
              })
            ],
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomSizedBox(
                        text: AppLocalizations.of(context)!.newOrder,
                        onTapCallback: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => NewOrder()),
                          // );
                        },
                      ),
                      CustomSizedBox(
                        text: "Order List",
                        onTapCallback: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => OrderList()),
                          // );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomMidContainer(
                                  icon: Icons.delivery_dining,
                                  text: AppLocalizations.of(context)!.delivery,
                                ),
                                CustomMidContainer(
                                  icon: Icons.abc,
                                  text: "Registration",
                                  onTapCallback: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignIn(),
                                      ),
                                    );
                                  },
                                ),
                                CustomMidContainer(
                                  icon: Icons.factory_outlined,
                                  text: AppLocalizations.of(context)!.factory,
                                  onTapCallback: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ManufacturerRegister(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomMidContainer(
                                  icon: Icons.people,
                                  text: AppLocalizations.of(context)!.customer,
                                  onTapCallback: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => OrderProduct(),
                                    //   ),
                                    // );
                                  },
                                ),
                                CustomMidContainer(
                                  icon: Icons.library_books_outlined,
                                  text: AppLocalizations.of(context)!.catalogue,
                                  onTapCallback: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Catalogue(),
                                      ),
                                    );
                                  },
                                ),
                                CustomMidContainer(
                                  icon: Icons.person_2,
                                  text: AppLocalizations.of(context)!.profile,
                                  onTapCallback: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => Profile(),
                                    //   ),
                                    // );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.kOrangeColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButtomNavTab(
                          text: AppLocalizations.of(context)!.days,
                          icon: Icons.date_range,
                          onTapCallBack: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ProductGet(),
                            //   ),
                            // );
                          },
                        ),
                        CustomButtomNavTab(
                          text: AppLocalizations.of(context)!.calculator,
                          icon: Icons.calculate,
                          onTapCallBack: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Calculator(),
                            //   ),
                            // );
                          },
                        ),
                        CustomButtomNavTab(
                          text: AppLocalizations.of(context)!.notification,
                          icon: Icons.notifications,
                        ),
                        CustomButtomNavTab(
                            text: AppLocalizations.of(context)!.menu,
                            icon: Icons.menu),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
