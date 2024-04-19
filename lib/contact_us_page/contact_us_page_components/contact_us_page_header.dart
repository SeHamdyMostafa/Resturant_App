import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:restaurantapp/Device_Dimenssions.dart';

class ContactUsPageHeader extends StatelessWidget {
  const ContactUsPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.orange,
                ),
            ],
          ),
          Container(
              child: SizedBox(
            child: Lottie.asset(
                'assets/animated_vectors/contact_us_animation.json'),
          )),
          Container(
            alignment: Alignment.center,
            child: Text('Contact Us'.tr,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: DeviceDimenssions.deviceHeight * .04,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '🍀 Our Team Would like To Hear You ! 🍀'.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
