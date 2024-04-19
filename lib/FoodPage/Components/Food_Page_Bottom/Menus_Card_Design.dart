import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/FoodPage/Components/Food_Page_Bottom/FoodModel.dart';


class MenusCardDesign extends StatefulWidget {
  MenusCardDesign({
    super.key,
    required this.foodModel,
  });
  FoodModel foodModel;

  @override
  State<MenusCardDesign> createState() => _MenusCardDesignState();
}

class _MenusCardDesignState extends State<MenusCardDesign> {
  bool _isHovered = false;
  IconData? iconData;
  CollectionReference UserCard =
      FirebaseFirestore.instance.collection('UserCard');
  CollectionReference UserFavoriate =
      FirebaseFirestore.instance.collection('UserFavoriate');

  @override
  void initState() {
    super.initState();
    checkIfDocumentExists();
  }

  void checkIfDocumentExists() {
     final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    UserFavoriate.where('UserEmail', isEqualTo: email).where('ProductName',isEqualTo: widget.foodModel.name)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          iconData = Icons.favorite;
        });
        print('Document exists!');
      } else {
        setState(() {
          iconData = Icons.favorite_outline;
        });
        print('Document does not exist!');
      }
    }).catchError((error) {
      print('Error checking document: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceDimenssions.deviceWidth * .6,
      height: DeviceDimenssions.deviceHeight * .3,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 35,
            child: Container(
              width: DeviceDimenssions.deviceWidth * .6,
              height: DeviceDimenssions.deviceHeight * .26,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 205, 205, 205),
                    blurRadius: 8.0,
                    spreadRadius: 4.0,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MouseRegion(
                          onEnter: (_) => setState(() => _isHovered = true),
                          onExit: (_) => setState(() => _isHovered = false),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (iconData == Icons.favorite) {
                                    iconData = Icons.favorite_outline;
                                    removeFromFavorites();
                                  } else {
                                    iconData = Icons.favorite;
                                    addToFavorites();
                                  }
                                });
                              },
                              child: Icon(
                                iconData,
                                color: _isHovered ? Colors.white : Colors.red,
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.foodModel.name,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: DeviceDimenssions.deviceHeight * .07,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      widget.foodModel.description,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHovered = true),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(width: 1, color: Colors.orange)),
                          backgroundColor:
                              _isHovered ? Colors.orange : Colors.white,
                          foregroundColor: Colors.orange,
                          elevation: 0,
                        ),
                        onPressed: () {
                          addToCard();
                        },
                        label: Row(
                          children: [
                            const Text(
                              'Add to Cart - ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              widget.foodModel.price,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.foodModel.image,
              width: DeviceDimenssions.deviceWidth * .23, // corrected spelling
              height: DeviceDimenssions.deviceHeight * .11,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  void addToFavorites() {
     final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    UserFavoriate.add({
      'UserEmail': email,
      'ProductImage': widget.foodModel.image,
      'ProductName': widget.foodModel.name,
      'ProductDescription': widget.foodModel.description,
      'ProductPrice': widget.foodModel.price,
    });
  }

  void removeFromFavorites() {
    UserFavoriate.where('ProductName', isEqualTo: widget.foodModel.name)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var documentSnapshot in querySnapshot.docs) {
        documentSnapshot.reference.delete();
      }
    });
  }

  void addToCard() {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    
    UserCard.add({
      'UserEmail': email,
      'ProductImage': widget.foodModel.image,
      'ProductName': widget.foodModel.name,
      'ProductDescription': widget.foodModel.description,
      'ProductPrice': widget.foodModel.price
    });
  }
}
