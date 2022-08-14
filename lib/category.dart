// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:trade_app/components/bottomNavigation.dart';
import 'package:trade_app/components/header.dart';
import 'package:trade_app/productDetail.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;

  CategoryPage(this.categoryTitle);

  List<Map> products = [
    {
      "isim": "Surface laptop 3",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "999"
    },
    {
      "isim": "iPhone 11 Pro",
      "fotograf": "assets/images/iphone11pro.jpg",
      "fiyat": "850"
    },
    {
      "isim": "Macbook",
      "fotograf": "assets/images/macbook.jpg",
      "fiyat": "300"
    },
    {
      "isim": "Surface laptop 6",
      "fotograf": "assets/images/speakers2.jpg",
      "fiyat": "899"
    },
    {
      "isim": "Surface laptop 7",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "666"
    },
    {
      "isim": "Surface laptop 8",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "777"
    },
    {
      "isim": "Surface laptop 9",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "1000"
    },
    {
      "isim": "Surface laptop 3",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "999"
    },
    {
      "isim": "Surface laptop 4",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "850"
    },
    {
      "isim": "Surface laptop 5",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "300"
    },
    {
      "isim": "Surface laptop 6",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "899"
    },
    {
      "isim": "Surface laptop 7",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "666"
    },
    {
      "isim": "Surface laptop 8",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "777"
    },
    {
      "isim": "Surface laptop 9",
      "fotograf": "assets/images/computer.jpg",
      "fiyat": "1000"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            header(categoryTitle, context),
            SizedBox(height: 32),

            //İçerikler
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                children: products.map((Map product) {
                  return buildContent(product["isim"], product["fotograf"],
                      product["fiyat"], context);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      //bottom navigation
      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildContent(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Image.asset(
            photoUrl,
            height: 80,
            width: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0A1034),
                ),
              ),
              Text(
                "USD $price",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0001FC),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
