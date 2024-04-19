

import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Setting_Content_Page/Setting_Page.dart';

class FoodPageHeader extends StatelessWidget {
  const FoodPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/myphoto.jpg"),
                    ),
                    SizedBox(width: 10,),
                    Text(
                  'Hamdi Mostafa',
                  style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  ),
                ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xfff3cd5a),
                    border: Border.all(width: 1,color: Color(0xfff3cd5a)),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Icon(Icons.notifications_outlined,color: const Color.fromARGB(255, 30, 30, 30),size: 30,),
                )
              ],
            ),
            
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: DeviceDimenssions.deviceWidth*.8,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Search",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                   width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xfff3cd5a),
                    border: Border.all(width: 1,color: Color(0xfff3cd5a)),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Setting_Page();
                    }));
                  }, icon: Icon(Icons.tune_outlined,color: const Color.fromARGB(255, 30, 30, 30),size: 20,))
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
