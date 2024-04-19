import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage("assets/homeimage.jpg"),
                ),
                Positioned(
                  top: 210,
                  bottom: 0,
                  left: 40,
                  right: 40,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 221, 218, 212),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(0, 0))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "GOIN FOOD",
                          style: TextStyle(color:  Colors.orange, fontSize: 26),
                        ),
                        Text(
                          "Restaurant",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}