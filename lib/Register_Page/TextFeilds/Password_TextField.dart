import 'package:flutter/material.dart';

class Password_TextField extends StatelessWidget {
   Password_TextField({super.key ,required this.onChanged,required this.controller});
    Function(String) onChanged;
TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  controller: controller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your Password",
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
                return 'Please enter a new password';
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
                  );
  }
}