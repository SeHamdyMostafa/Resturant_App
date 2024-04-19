import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Favoriate_Page/Favoriate_Model.dart';

class Favorite_Card_Design extends StatelessWidget {
   Favorite_Card_Design({super.key,required this.favoriate_model});
    Favoriate_Model favoriate_model;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 10),
      child: Container(
        height: DeviceDimenssions.deviceHeight * .3,
        child: Stack(
          children:[
            Container(
            height: DeviceDimenssions.deviceHeight * .24,
                  width: DeviceDimenssions.deviceWidth * .9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                        BoxShadow(
                        color: Color.fromARGB(255, 205, 205, 205),
                        blurRadius: 8.0,
                        spreadRadius: 4.0,
                        offset: Offset(0, 8),
                            ),
                          ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(favoriate_model.Name!,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color: Colors.black),),
                  SizedBox(height: 15,),
                  Container(
                    width: DeviceDimenssions.deviceWidth * .6,
                    child: Text(favoriate_model.description!,style: TextStyle(fontSize: 12,color: Colors.grey),maxLines: 3,overflow: TextOverflow.ellipsis,)),
                    SizedBox(height: 15,),
                  Text(favoriate_model.price!+"\$",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color: Colors.black),),
                ],
              ),
            ),
                  ),
                  Positioned(
                    top: 70,
                    right: 5,
                    child: CircleAvatar(
                            radius: 55,
                            
                            backgroundImage: NetworkImage(
                favoriate_model.image
                  )
                    )
                  )
      
          ] 
        ),
      ),
    );
  }
}