import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurantapp/Battom_NavBar.dart';
import 'package:slider_button/slider_button.dart';

class HomePageBottom extends StatelessWidget {
  const HomePageBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SliderButton(
              action: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return BottomNavBar();
                }));
                return false;
              },
              backgroundColor: Colors.orange,
              baseColor:Colors.white,
              label: const Text(
                "Slide to start",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              icon: const Center(
                  child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.orange,
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              )),
              boxShadow: BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 4,
              ),
            );
  }
}