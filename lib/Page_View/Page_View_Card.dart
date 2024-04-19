import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Page_View/Page_View_Model.dart';

class Page_View_Card extends StatelessWidget {
   Page_View_Card({super.key,required this.page_view_model});
    Page_View_Model page_view_model;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
            height: DeviceDimenssions.deviceHeight * .3,
            width: DeviceDimenssions.deviceWidth * .5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              
            ),
            child: Container(
              height: 200,
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),
              color: Colors.white,
              image: DecorationImage(image: AssetImage(page_view_model.image),fit:BoxFit.fill)
              
              ),
               
    
              ),
            
          ),
    );
  }
}