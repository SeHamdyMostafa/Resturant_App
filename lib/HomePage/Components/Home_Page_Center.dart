import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/FoodPage/Food_Page.dart';

class HomePageCenter extends StatelessWidget {
  const HomePageCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            child: Column(
              children: [
                Text(
                  "Enjoy the best",
                  style: TextStyle(color: Colors.black, fontSize: 36),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "food",
                      style: TextStyle(color: Colors.orange, fontSize: 36),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "with",
                      style: TextStyle(color: Colors.black, fontSize: 36),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "us...",
                      style: TextStyle(color: Colors.black, fontSize: 36),
                    ),
                    Text(
                      "🍔",
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(height: DeviceDimenssions.deviceHeight*.05),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
                Text(
                  "Habitant hendrerit commodo vitae rhoncus, leo a ut morbi.",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
                Text(
                  "Malesuada aliquam ullamcorper cursus tempor.",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ],
            ),
          );
  }
}