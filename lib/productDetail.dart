// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:trade_app/components/bottomNavigation.dart';
import 'package:trade_app/components/header.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;
  ProductDetailPage(this.productTitle);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Color selectedColor;
  late int selectedCapacity = 64;
  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFFEBEBE4),
    Color.fromARGB(255, 37, 146, 70),
    Color(0xFFF5D8C0),
  ];

  List<int> capacities = [64, 256, 512];

  @override
  void initState() {
    selectedColor = Colors.black;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // header
            header(widget.productTitle, context),
            SizedBox(height: 32),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //new etiketi
                    // label("New"),
                    // SizedBox(height: 25),

                    // ürün fotoğraf
                    Image.asset("assets/images/smartphone.jpg"),
                    SizedBox(height: 30),

                    // renk seçenekleri
                    Text(
                      "Color",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A1034),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: colors
                          .map((Color color) => colorOption(
                              colors: color,
                              selected: selectedColor != color,
                              onTap: () {
                                setState(() {
                                  selectedColor = color;
                                });
                              }))
                          .toList(),
                    ),

                    //kapasite seçenekleri
                    SizedBox(height: 32),
                    Text(
                      "Capacity",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A1034),
                      ),
                    ),
                    SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: capacities
                          .map((int number) => capacityOption(
                              capacity: number,
                              selected: selectedCapacity == number,
                              onTap: () {
                                setState(() {
                                  selectedCapacity = number;
                                });
                              }))
                          .toList(),
                    ),
                    SizedBox(height: 15),

                    //sepete ekle butonu
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFF1F53E4),
                      ),
                      child: Text(
                        "Add to cart ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            )
          ])),
      bottomNavigationBar("search"),
    ])));
  }
}

Widget colorOption({colors, selected, onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors,
          border: Border.all(color: Colors.black, width: selected! ? 1 : 3)),
      width: 23,
      height: 23,
    ),
  );
}

Widget capacityOption({capacity, selected, onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Text(
        "$capacity gb",
        style: TextStyle(
          color: Color(selected ? 0xFF0001FC : 0xFFA7A9BE),
          fontSize: 16,
        ),
      ),
    ),
  );
}
