import 'package:flutter/material.dart';
import 'package:restaurantapp/FoodPage/Components/Food_Page_Bottom/Food_Page_Bottom.dart';
import 'package:restaurantapp/FoodPage/Components/Category_Card_Design.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/FoodPage/Components/Food_Page_Header.dart';
import 'package:restaurantapp/HomePage/HomePage.dart';
import 'package:restaurantapp/Page_View/PageView.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodPage extends StatefulWidget {
  FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  PageController pageController = PageController();
  Widget sizedBox = FoodPageBottom(
    collectionname: "chicken_food",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  FoodPageHeader(),
                  SizedBox(height: 10,),
                  Container(
                    height: DeviceDimenssions.deviceHeight*.17,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              CategoryCardDesign(
                  Image: "assets/chicken.png",
                  Name: "chicken",
                  ontap: () {
                    setState(() {
                      sizedBox = FoodPageBottom(
                        collectionname: "chicken_food",
                      );
                    });
                  }),
              CategoryCardDesign(
                  Image: "assets/pizza.png",
                  Name: "pizza",
                  ontap: () {
                    setState(() {
                      sizedBox = FoodPageBottom(
                        collectionname: "Pizaa",
                      );
                    });
                  }),
              CategoryCardDesign(
                  Image: "assets/burger.png",
                  Name: "burger",
                  ontap: () {
                    setState(() {
                      sizedBox = FoodPageBottom(
                        collectionname: "chicken_food",
                      );
                    });
                  }),
            ],
          ),
        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Offers",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: DeviceDimenssions.deviceHeight * .25,
                    child: OffersPage(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Popular Choices 🔥",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
          height: DeviceDimenssions.deviceHeight * .35,
          child: sizedBox,
        )
                  
                  
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}