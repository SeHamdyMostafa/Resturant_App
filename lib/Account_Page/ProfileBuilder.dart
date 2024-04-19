import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Account_Page/Profile.dart';
import 'package:restaurantapp/Account_Page/ProfileModel.dart';


class ProfileBuilder extends StatefulWidget {
  const ProfileBuilder({Key? key});

  @override
  State<ProfileBuilder> createState() => _ProfileBuilderState();
}

class _ProfileBuilderState extends State<ProfileBuilder> {
  late Future<QuerySnapshot> _profileFuture;
  late ProfileModel profileModel;

  @override
  void initState() {
    super.initState();
    _profileFuture = _fetchCartItems();
  }

  Future<QuerySnapshot> _fetchCartItems() async {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;

    if (email != null) {
      final Profileitems = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      print('Authenticated user email: $email');
      return Profileitems;
    } else {
      throw Exception("User email not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _profileFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error retrieving data'),
          );
        } else if (snapshot.hasData) {
          List<ProfileModel> list = [];
          for (var item in snapshot.data!.docs) {
            ProfileModel profileModel = ProfileModel(
              name: item['full_name'],
              email: item['email'],
              phone: item['phone'],
              gender: item['gender'],
              pirthdate: item['pirthdate'],
              Address: item['UserAdress'],
            );
            list.add(profileModel);
          }
          if (list.isNotEmpty) {
            profileModel = list[0];
            return Profile(profileModel: profileModel);
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        } else {
          return const Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}
