import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Page_View/Page_View_Card.dart';
import 'package:restaurantapp/Page_View/Page_View_Model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OffersPage extends StatelessWidget {
  OffersPage({super.key});
  List<Page_View_Model> Page_View_List=[
    Page_View_Model(image: "assets/Pizza_Offer.png"),
    Page_View_Model(image: "assets/Pizza_Offer.png"),
    Page_View_Model(image: "assets/Pizza_Offer.png"),
    Page_View_Model(image: "assets/Pizza_Offer.png"),
  ];

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: BouncingScrollPhysics(),
      controller: controller,
      children: [
        Page_View_Card(page_view_model: Page_View_List[0],),
        Page_View_Card(page_view_model: Page_View_List[1],),
        Page_View_Card(page_view_model: Page_View_List[2],),
        Page_View_Card(page_view_model: Page_View_List[3],),
      ],
    );
  }
}
