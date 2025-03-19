import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/shoe1.jpg',
  'assets/images/shoe2.jpg',
  'assets/images/shoe3.jpg',
  'assets/images/shoe4.jpg',
  'assets/images/shoe5.jpg',
];

final List<String> companyList = [
  'assets/images/adidas.png',
  'assets/images/puma.png',
  'assets/images/nike.png',
  'assets/images/fila.png',
  'assets/images/skechers.png',
  'assets/images/new-balance.png',
  'assets/images/skechers.png',
  'assets/images/skechers.png',
  'assets/images/skechers.png',
  'assets/images/skechers.png',
  'assets/images/skechers.png',
  'assets/images/skechers.png',
];

final List<String> companyNameList = [
  'Adidas',
  'Puma',
  'Nike',
  'Fila',
  'Skechers',
  'New \nBalance',
  'Skechers',
  'Skechers',
  'Skechers',
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Icon(Icons.clear_all_rounded, size: 20),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.grey.shade100,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Text('Drawer Header'),
            ),

            ListTile(
              leading: Icon(FluentIcons.home_20_filled),
              title: Text('Menu 1'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Menu 2'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text('Menu 3'),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,

                        fillColor: Colors.grey.shade200,
                        prefixIcon: Icon(FluentIcons.search_32_regular),
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                SizedBox(
                  width: 40,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Icon(FluentIcons.options_16_regular),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

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
                      height: 170,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Your favorite stores',
                  style: TextStyle(fontFamily: 'GalanoGrotesqueMedium'),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(9, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey.shade200,
                              ),
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                companyList[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          SizedBox(height: 20,
                            child: Text(
                              companyNameList[index],
                              style: TextStyle(
                                fontFamily: 'GalanoGrotesqueMedium',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
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
