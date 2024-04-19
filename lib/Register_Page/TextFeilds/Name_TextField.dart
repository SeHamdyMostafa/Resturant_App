import 'package:flutter/material.dart';

class Name_TextField extends StatelessWidget {
  Name_TextField({super.key,required this.onChanged,required this.controller});
  Function(String) onChanged;
TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  controller: controller,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        hintText: "Enter your Full Name",
                        labelStyle: TextStyle(color: Colors.grey),  
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.orange),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.orange),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                      onChanged:onChanged,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        } else if (value.length < 8) {
                          return "Name should be atleast 8 characters";
                        }else
                          return null;
                      },
                    );
  }
}