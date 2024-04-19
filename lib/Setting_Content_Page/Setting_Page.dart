import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Address_Page/Adress_Page.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Register_Page/Register_Page.dart';
import 'package:restaurantapp/Setting_Content_Page/Change_Email_Page.dart';
import 'package:restaurantapp/Setting_Content_Page/Change_Password_Page.dart';
import 'package:restaurantapp/Setting_Content_Page/Setting_Card_Design.dart';
import 'package:restaurantapp/Setting_Content_Page/Setting_Page_Model.dart';
import 'package:restaurantapp/contact_us_page/contact.dart';

class Setting_Page extends StatelessWidget {
  Setting_Page({super.key});
  List<Setting_Page_Model> SettingList = [
    Setting_Page_Model(
        text: "Saved Address",
        Page: Address_Page(),
        icon: Icons.arrow_forward_ios,
        leadingIcon:Icons.location_on_outlined,),
    Setting_Page_Model(
        text: "Change email",
        Page: Change_Email_Page(),
        icon: Icons.arrow_forward_ios,
        leadingIcon:Icons.email_outlined,),
    Setting_Page_Model(
        text: "Change password",
        Page: Change_Password_page(),
        icon: Icons.arrow_forward_ios,
        leadingIcon:Icons.lock_outline,),
    Setting_Page_Model(
        text: "FAQ & Help", Page: Page, icon: Icons.arrow_forward_ios,leadingIcon:Icons.help_outline,),
    Setting_Page_Model(
        text: "Contact with us", Page: ContactPage(), icon: Icons.arrow_forward_ios,leadingIcon:Icons.contact_page_outlined,),
    Setting_Page_Model(
        text: "Language", Page: Page, icon: Icons.arrow_forward_ios,leadingIcon:Icons.language_outlined,),
    Setting_Page_Model(
        text: "Country", Page: Page, icon: Icons.arrow_forward_ios,leadingIcon:Icons.public_outlined),
    Setting_Page_Model(text: "App feedback", Page: Page, icon: Icons.arrow_forward_ios,leadingIcon:Icons.star_border_outlined,),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Details",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: double.infinity,
                  height: DeviceDimenssions.deviceHeight * 0.26,
                  child: Column(
                    children: [
                      Setting_Card_Design(setting_page_model: SettingList[0]),
                      Setting_Card_Design(setting_page_model: SettingList[1]),
                      Setting_Card_Design(setting_page_model: SettingList[2]),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Support",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: double.infinity,
                  height: DeviceDimenssions.deviceHeight * 0.17,
                  child: Column(
                    children: [
                      Setting_Card_Design(setting_page_model: SettingList[3]),
                      Setting_Card_Design(setting_page_model: SettingList[4]),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "More",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: double.infinity,
                  height: DeviceDimenssions.deviceHeight * 0.26,
                  child: Column(
                    children: [
                      Setting_Card_Design(setting_page_model: SettingList[5]),
                      Setting_Card_Design(setting_page_model: SettingList[6]),
                      Setting_Card_Design(setting_page_model: SettingList[7]),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Center(
                  child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side:
                                  BorderSide(width: 1, color: Colors.orange)),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          textStyle: TextStyle(fontSize: 12),
                        ),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                return RegisterPage();
              }),(route) => false,);
                          
                        },
                        icon: Icon(Icons.logout_outlined,size: 14,),
                        label: Text(
                          'Logout',
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),);
  }
}
