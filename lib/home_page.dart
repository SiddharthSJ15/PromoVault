import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/shoe1.jpg',
  'assets/images/shoe2.jpg',
  'assets/images/shoe3.jpg',
  'assets/images/shoe4.jpg',
  'assets/images/shoe5.jpg',
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   leading: Icon(FluentIcons.options_16_regular),
      // ),
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    )
                  ),
                )),
                SizedBox(width: 10),
                SizedBox(child: Icon(FluentIcons.options_16_regular,))
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView(
                children: [
                  CarouselSlider(
                    items: [
                      carouselImage('assets/images/shoe1.jpg'),
                      carouselImage('assets/images/shoe2.jpg'),
                      carouselImage('assets/images/shoe3.jpg'),
                      carouselImage('assets/images/shoe4.jpg'),
                    ],
                    options: CarouselOptions(
                      height: 180,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget carouselImage(String value) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(value), fit: BoxFit.cover),
      ),
    );
  }
}
