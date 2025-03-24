import 'package:flutter/material.dart';
import 'package:promo_vault/const.dart';

final List<Map<String, String>> bankList = [
  {'image': 'assets/images/sbi.png', 'name': 'State Bank of India'},
  {'image': 'assets/images/union-bank.png', 'name': 'Union Bank of India'},
  {'image': 'assets/images/federal-bank.png', 'name': 'Federal Bank'},
  {'image': 'assets/images/south-india.png', 'name': 'South Indian Bank'},
];

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Popular Cards',
                    style: TextStyle(
                      fontFamily: 'GalanoGrotesqueMedium',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Flexible(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    crossAxisSpacing: 1,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: bankList.length,
                  itemBuilder: (context, index) {
                    final bank = bankList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(                              
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(bank['image'] ?? ''),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Icon(Icons.add_rounded),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(bank['name'] ?? '',style: TextStyle(fontFamily: 'GalanoGrotesqueMedium',fontSize: 14),),
                              ],
                            )

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 15,),

            
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 70),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_rounded,color: Colors.white,size: 25,),
                    SizedBox(width: 10,),
                    Text('Add another card',style: TextStyle(fontFamily: 'GalanoGrotesqueMedium',fontSize: 16,color: Colors.white),),
                  ],
                ),
              ),

              SizedBox(height: 15,),


              Image.asset('assets/images/popular_card.jpg')

            ],
          ),
        ),
      ),
    );
  }
}
