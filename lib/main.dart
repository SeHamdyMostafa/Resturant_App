import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/HomePage/HomePage.dart';
import 'package:restaurantapp/Register_Page/Register_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
  
Future<void> main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions .currentPlatform,
);
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          const Center(
              child: CircularProgressIndicator(),
            );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return const Homepage();
        }
        return RegisterPage();
      },)
    );
  }

  
}

