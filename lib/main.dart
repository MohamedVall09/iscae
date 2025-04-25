import 'package:flutter/material.dart';
import 'package:iscae_app/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iscae_app/screens/home_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ISCAEApp());
}


class ISCAEApp extends StatelessWidget {
  const ISCAEApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => Auth(),
        '/home': (context) => HomeScreen(),
      },
      title: 'ISCAE App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Arial',
        primarySwatch: Colors.teal,
      ),
    );
  }
}