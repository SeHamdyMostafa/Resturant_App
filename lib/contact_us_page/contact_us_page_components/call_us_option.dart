import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:url_launcher/url_launcher.dart';


class CallUsOption extends StatelessWidget {
  const CallUsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // will add any number as we need
        String phoneNumber = '+201096482183';

        final Uri params = Uri(
          scheme: 'tel',
          path: "phoneNumber",
        );

// Launch the URL with the phone number parameter.
        await launch(params.toString());
      },
      child: Column(
        children: [
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child:Icon(Icons.call_outlined,size: 24,color:Color(0xfffec569) ,)
              ),
              SizedBox(height: 5,),
              Text('Call Us'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xfffec569),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
