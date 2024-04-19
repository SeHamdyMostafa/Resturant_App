import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/FoodPage/Components/Food_Page_Bottom/Menus_Card_Design.dart';
import 'package:restaurantapp/FoodPage/Components/Food_Page_Bottom/FoodModel.dart';

class FoodPageBottom extends StatelessWidget {
   FoodPageBottom({super.key,required this.collectionname});
   String collectionname;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection(collectionname).get(), 
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<FoodModel> list=[];
          for (var item in snapshot.data!.docs) {
      FoodModel foodModel = FoodModel(
        name:item['name'], 
        description:item['description'],
         price:item['price'], 
         image:item['image']);
         list.add(foodModel);

    }
return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection:Axis.horizontal,
      itemCount: list.length,
       itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: MenusCardDesign(foodModel: list[index]),
        );
      },
    );
        }else if(snapshot.hasError){
          print("error");
        }return Center(child: 
        Container(
          child: CircularProgressIndicator())
          );
      },
    
      );
  }
}