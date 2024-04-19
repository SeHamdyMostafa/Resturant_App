import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Address_Page/TextField_Desgin.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Account_Page/Profile.dart';
import 'package:restaurantapp/Register_Page/Login_Page/Login_Form_Page.dart';

class Office_Form extends StatefulWidget {
  const Office_Form({super.key});

  @override
  State<Office_Form> createState() => _Office_FormState();
}

class _Office_FormState extends State<Office_Form> {
 
  final _formKey = GlobalKey<FormState>();
  String? BildingName;
  String? Office;
  String? Floor;
  String? Street;
  String? City;

  late final TextEditingController BildingNamecontroller;
  late final TextEditingController Officecontroller;
  late final TextEditingController Floorcontroller;
  late final TextEditingController Streetcontroller;
  late final TextEditingController Citycontroller;

  CollectionReference users=FirebaseFirestore.instance.collection('users');



  @override
  Widget build(BuildContext context) {
    return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField_Design(
                    hintname: 'Building Name',
                    controllervalue: BildingNamecontroller,
                    keyboardtype: TextInputType.text,
                    ontap: (value) {
                      BildingName=value;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: DeviceDimenssions.deviceWidth * .5,
                        child: TextField_Design(
                          hintname: 'Company',
                          controllervalue: Officecontroller,
                          keyboardtype: TextInputType.text,
                          ontap: (value) {
                      Office=value;
                    },
                        ),
                      ),
                      Container(
                        width: DeviceDimenssions.deviceWidth * .5,
                        child: TextField_Design(
                          hintname: 'Floor',
                          controllervalue: Floorcontroller,
                          keyboardtype: TextInputType.number,
                          ontap: (value) {
                      Floor=value;
                    },
                        ),
                      ),
                    ],
                  ),
                  TextField_Design(
                    hintname: 'Street',
                    controllervalue: Streetcontroller,
                    keyboardtype: TextInputType.text,
                    ontap: (value) {
                      Street=value;
                    },
                  ),
                  TextField_Design(
                    hintname: 'City',
                    controllervalue: Citycontroller,
                    keyboardtype: TextInputType.name,
                    ontap: (value) {
                      City=value;
                    },
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                            final user = FirebaseAuth.instance.currentUser;
                      String? email = user!.email!;
                          final QuerySnapshot snapshot = await FirebaseFirestore
                      .instance
                      .collection('users')
                      .where('email', isEqualTo: email)
                      .get();
                  final List<DocumentSnapshot> documents = snapshot.docs;
                  for (var document in documents) {
                    await document.reference.update({
                      'UserAdress': "${BildingNamecontroller.text} Building ${Officecontroller.text} Company   Floor.No ${Floorcontroller.text} ${Streetcontroller.text} ${Citycontroller.text}",
                    });
                  }
                        } else {
                          print("Not Validated");
                        }
                      },
                      child: Container(
                        height: DeviceDimenssions.deviceHeight * 0.08,
                        width: DeviceDimenssions.deviceWidth * 0.5,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Save address",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}
  