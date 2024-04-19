import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/FoodPage/Food_Page.dart';
import 'package:restaurantapp/Register_Page/Login_Page/Login_Form_Page.dart';
import 'package:restaurantapp/Register_Page/Register_Page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Email_TextField.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Name_TextField.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Password_TextField.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Phone_TextField.dart';
import 'package:restaurantapp/healper/showSnackBar.dart';


class Signup_Form extends StatefulWidget {
  Signup_Form({super.key});

  @override
  State<Signup_Form> createState() => _Signup_FormState();
}

class _Signup_FormState extends State<Signup_Form> {
  final _formKey = GlobalKey<FormState>();

  String? name;

  String? email;

  String? password;

  String? phoneNumber;

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final phoneNumberController = TextEditingController();

  String? selectedOption;
   final  dateInput = TextEditingController();
   String? _Date;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: DeviceDimenssions.deviceWidth * .9,
          height: DeviceDimenssions.deviceHeight * .6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
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
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Name_TextField(
                      controller: nameController,
                      onChanged: (Value) {
                        name = Value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Phone_TextField(
                      controller: phoneNumberController,
                      onChanged: (Value) {
                        phoneNumber = Value;
                      },
                    ),
                    SizedBox(height: 10),
                    Email_TextField(
                      controller: emailController,
                      onChanged: (Value) {
                        email = Value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Password_TextField(
                      controller: passwordController,
                      onChanged: (Value) {
                        password = Value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black,fontSize: 14),
                      controller: dateInput,
                      decoration: InputDecoration(
                        labelText: "Pirthdate",
                        hintText: "Enter your pirthdate",
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        contentPadding: EdgeInsets.all(10),
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ), //icon of text field
                        //label text of field
                      ),
                      readOnly: true,
                      onChanged: (value) {
                        setState(() {
                          _Date = value;
                        });
                      },
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package => 2021-03-16
                          setState(() {
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Birth date';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Gender",
                            style: TextStyle(fontSize: 24),
                          )),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Male',
                              activeColor: Colors.orange,
                              groupValue: selectedOption,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedOption = value!;
                                });
                              },
                            ),
                            Text("Male"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Female',
                              groupValue: selectedOption,
                              activeColor: Colors.orange,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedOption = value!;
                                });
                              },
                            ),
                            Text("Female"),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: email!, password: password!);

                                    users.add({
                                'full_name': nameController.text, // John Doe
                                'email':
                                    emailController.text, // Stokes and Sons
                                'phone': phoneNumberController.text, // 42
                                'password': passwordController.text,
                                'gender' :selectedOption.toString(),
                                'pirthdate':dateInput.text,
                                'UserAdress':"No address Now"
                              })
                              .then((value) => print("User Added"))
                              .catchError((error) =>
                               showSnackBar(context,
                                  "Failed to add user: $error")
                                 );

                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 3), () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()),
                                      (route) => false,
                                    );
                                  });
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Lottie.asset(
                                        'assets/animated_vectors/Sign-up-success.json',
                                        repeat: false),
                                  );
                                });
                                
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(context,
                                  "The password provided is too weak.");
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context,
                                  "The account already exists for that email.");
                            } 
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      child: Container(
                        height: DeviceDimenssions.deviceHeight * 0.08,
                        width: DeviceDimenssions.deviceWidth * 0.5,
                        decoration: BoxDecoration(
                            color: Color(0xffF54A6A),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign Up",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
