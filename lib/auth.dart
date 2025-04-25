import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iscae_app/screens/home_screen.dart';
import 'package:iscae_app/screens/login_screen.dart';



class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return HomeScreen();
        }else {
          return LoginScreen();
        }
      },
      )
    );
  }
}