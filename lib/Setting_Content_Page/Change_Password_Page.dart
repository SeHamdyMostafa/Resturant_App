import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Account_Page/Profile.dart';
import 'package:restaurantapp/Account_Page/Edit_Profile_Page.dart';

class Change_Password_page extends StatefulWidget {
  const Change_Password_page({super.key});

  @override
  State<Change_Password_page> createState() => _Change_Password_pageState();
}

class _Change_Password_pageState extends State<Change_Password_page> {
  final _formKey = GlobalKey<FormState>();
  String _Current_Password = '';
  String _new_password = '';
  String _confirm_new_password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Change Password',
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
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
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
                  return Password_Validate(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Enter new password",
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
                    _new_password = value;
                  });
                },
                validator: (value) {
                  return Password_Validate(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Enter confirm new password",
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
                    _confirm_new_password = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
      return 'Please enter a new password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain uppercase letter';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain lowercase letter';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain number';
    } else if (!value
        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain special character';
    }else if (_new_password != value) {
      return 'Passwords do not match';
    }
    return null;
  }
                
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password must be at least 8 characters and should include:",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "• 1 number (0-9)",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    "• 1 uppercase letter (A-Z)",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text("• 1 lowercase letter (a-z)",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      )),
                  Text(
                    "• 1 special character (~@#\$%^&*__-+=,?/)",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              )),
            ),
            SizedBox(
              height: 20,
            ),
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
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  String? Password_Validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a new password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain uppercase letter';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain lowercase letter';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain number';
    } else if (!value
        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain special character';
    }
    return null;
  }
}
