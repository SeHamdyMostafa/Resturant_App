import 'package:flutter/material.dart';

class Phone_TextField extends StatelessWidget {
  Phone_TextField({super.key,required this.onChanged,required this.controller});
  Function(String) onChanged;
TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  controller: controller,

                    keyboardType:TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Phone number",
                      hintText: "Enter your phone",
                      
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
                return 'Please enter a new phone';
              } else if (value.length < 11) {
                return 'Phone number must be at least 11 number';
              } return null;
                    },
                  );
  }
}