// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trade_app/categories.dart';
import 'package:trade_app/components/bottomNavigation.dart';
import 'package:trade_app/components/label.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //BAŞLIK
                  buildBaslik(),

                  //BANNER
                  buildBanner(),

                  //BUTONLAR
                  Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ilk eleman
                          buildNavigation(
                            text: "Categories",
                            icon: Icons.menu,
                            widget: CategoriesPage(),
                            context: context,
                          ),
                          buildNavigation(
                            text: "Favorites",
                            icon: Icons.star_border,
                            widget: widget,
                            context: context,
                          ),
                          buildNavigation(
                            text: "Gifts",
                            icon: Icons.card_giftcard,
                            widget: widget,
                            context: context,
                          ),
                          buildNavigation(
                            text: "Best selling",
                            icon: Icons.people,
                            widget: widget,
                            context: context,
                          ),
                        ],
                      )),

                  const SizedBox(height: 40),

                  //SALES TITLE
                  const Text(
                    "Sales",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF0A1034)),
                  ),
                  const SizedBox(height: 16),

                  //SALES ITEMS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItems(
                        text: "Smartphones",
                        photoUrl: "assets/images/smartphone.jpg",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                      buildSalesItems(
                        text: "Monitors",
                        photoUrl: "assets/images/monitors.jpg",
                        discount: "-65%",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItems(
                        text: "Accessories",
                        photoUrl: "assets/images/accessories.jpg",
                        discount: "-15%",
                        screenWidth: screenWidth,
                      ),
                      buildSalesItems(
                        text: "Smart Objects",
                        photoUrl: "assets/images/watch.jpg",
                        discount: "-20%",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            // BOTTOM NAVIGATION BAR
            bottomNavigationBar("home"),
          ],
        ),
      ),
    );
  }
}

Widget buildBaslik() {
  return const Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Text(
      "Home",
      style: TextStyle(
        fontSize: 32,
        color: Color(
          0xFF0A1034,
        ),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildBanner() {
  return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
        decoration: BoxDecoration(
            color: const Color(0xFF0001FC),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Bose Home Speaker",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "USD 279",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Image.asset(
              "assets/images/speaker.jpg",
              height: 100,
              width: 100,
            ),
          ],
        ),
      ));
}

Widget buildNavigation(
    {required String text,
    required IconData icon,
    required Widget widget,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
          child: Icon(
            icon,
            color: const Color(0xFF0001FC),
            size: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF1F53E4),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget buildSalesItems({
  required String text,
  required String photoUrl,
  required String discount,
  required double screenWidth,
}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: const EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(discount),
        const SizedBox(height: 22),
        Image.asset(
          photoUrl,
          height: 100,
          width: 100,
        ),
        const SizedBox(height: 22),
        Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: Color(0xFF0A1034)),
          ),
        ),
      ],
    ),
  );
}
