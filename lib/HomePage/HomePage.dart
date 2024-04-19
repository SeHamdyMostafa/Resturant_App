import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/FoodPage/Food_Page.dart';
import 'package:restaurantapp/HomePage/Components/Home_Page_Bottom.dart';
import 'package:restaurantapp/HomePage/Components/Home_Page_Center.dart';
import 'package:restaurantapp/HomePage/Components/Home_Page_Header.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceDimenssions.init(c: context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomePageHeader(),
          HomePageCenter(),
           HomePageBottom(),
        ],
      ),
    );
  }
}
