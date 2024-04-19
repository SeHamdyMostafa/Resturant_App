import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Cart_Page/Cart_Item_Design.dart';
import 'package:restaurantapp/Cart_Page/Cart_Model.dart';
import 'package:restaurantapp/Register_Page/Login_Page/Login_Form_Page.dart';

class Cart_Page extends StatefulWidget {
  const Cart_Page({Key? key}) : super(key: key);

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  late Future<QuerySnapshot> _cartItemsFuture;
  

  @override
  void initState() {
    super.initState();
    _cartItemsFuture = _fetchCartItems();
  }

  Future<QuerySnapshot> _fetchCartItems() async {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    
    if(email!=null){
      final cartItems = await FirebaseFirestore.instance
        .collection('UserCard')
        .where('UserEmail', isEqualTo: email)
        .get();
print('Authenticated user email: $email');
    return cartItems;
    }else {
      throw Exception("User email not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My cart',
          style: TextStyle(color: Colors.black),
        ),
       
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _cartItemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(
              child: Text('Error retrieving data'),
            );
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            List<Cart_Model> cartItemsList = [];
            for (var item in snapshot.data!.docs) {
              Cart_Model cart_model = Cart_Model(
                Name: item['ProductName'],
                description: item['ProductDescription'],
                price: item['ProductPrice'],
                image: item['ProductImage'],
              );
              cartItemsList.add(cart_model);
            }
            return StatefulBuilder(
              builder: (context, setState) {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: cartItemsList.length,
                  itemBuilder: (context, index) {
                    return Cart_Item_Design(
                      cart_model: cartItemsList[index],
                      ondelete: () {
                        removeFromCart(setState, cartItemsList, index);
                      },
                    );
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text('Your cart is empty'),
            );
          }
        },
      ),
    );
  }

  void removeFromCart(StateSetter setState, List<Cart_Model> cartItemsList, int index) {
    setState(() {
      FirebaseFirestore.instance
          .collection('UserCard')
          .where('ProductName',
              isEqualTo: cartItemsList[index].Name)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs
            .forEach((DocumentSnapshot documentSnapshot) {
          documentSnapshot.reference.delete();
        });
      }).catchError((error) {
        print("Failed to delete documents: $error");
      });
      cartItemsList.removeAt(index);
      print("Item removed");
    });
  }


}
