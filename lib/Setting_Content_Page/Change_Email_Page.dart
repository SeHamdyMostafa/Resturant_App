import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';

class Change_Email_Page extends StatefulWidget {
  const Change_Email_Page({super.key});

  @override
  State<Change_Email_Page> createState() => _Change_Email_PageState();
}

class _Change_Email_PageState extends State<Change_Email_Page> {
  final _formKey = GlobalKey<FormState>();
  String _Newemail='';
  String _Confirm__Newemail='';
  String _Current_Password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Change email',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
       
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                    hintText: "Enter new email",
                    enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                onChanged: (value) {
                  setState(() {
                    _Newemail = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new email';
                  } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value) ==
                      false) {
                    return "This is not an email !!";
                  } else
                    return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                    hintText: "Enter confirm email",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                onChanged: (value) {
                  setState(() {
                    _Confirm__Newemail = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a confirm email';
                  } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value) ==
                      false) {
                    return "This is not an email !!";
                  } else if(_Newemail!=value){
                    return "Email do not much!";
                  }
                  else
                    return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                    hintText: "Enter current password",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                onChanged: (value) {
                  setState(() {
                    _Current_Password = value;
                  });
                },
               validator: (value) {
                    if (value == null || value.isEmpty) {
              return 'Please enter a current password';
              } else if (value.length < 8) {
              return 'Password must be at least 8 characters';
              } else if (!value.contains(RegExp(r'[A-Z]'))) {
              return 'Password must contain uppercase letter';
              } else if (!value.contains(RegExp(r'[a-z]'))) {
              return 'Password must contain lowercase letter';
              } else if (!value.contains(RegExp(r'[0-9]'))) {
              return 'Password must contain number';
              } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
              return 'Password must contain special character';
              }
                    return null;
                  },
              ),
            ),
            
           
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
            if (_formKey.currentState!.validate()) {
              // Perform login logic here
               /*Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Profile();
                          }));*/
            } else {
              print("Not Validated");
            }
          },
              child: Container(
                alignment: Alignment.center,
                height: DeviceDimenssions.deviceHeight * .08,
                width: DeviceDimenssions.deviceWidth * .8,
                decoration: BoxDecoration(
                  color: Colors.orange,
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: const Text("Submit",style: TextStyle(color: Colors.white,fontSize: 24),),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
