import 'package:flutter/material.dart';
import 'package:iscae_app/screens/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _emailController = TextEditingController();
  final __passwordController = TextEditingController();
  
  get onPressed => null;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    __passwordController.dispose();
  }
  

//   Future<void> signIn() async {
//   try {
//     final email = _emailController.text.trim();
//     final password = __passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       _showErrorDialog('Veuillez saisir votre adresse émail et votre mot de passe');
//       return;
//     }

//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   } on FirebaseAuthException catch (e) {
//     String message;

//     switch (e.code) {
//       case 'user-not-found':
//       case 'wrong-password':
//         message = 'Adresse émail ou mot de passe incorrect';
//         break;
//       case 'invalid-email':
//         message = 'Format d\'e-mail incorrect';
//         break;
//       case 'too-many-requests':
//         message = 'Trop de tentatives de connexion. Essayez plus tard';
//         break;
//       default:
//         message = 'Une erreur s\'est produite lors de la connexion. Réessayez';
//     }

//     _showErrorDialog(message);
//   }
// }

// void _showErrorDialog(String message) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Erreur'),
//       content: Text(message),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text('D\'accord'),
//         ),
//       ],
//     ),
//   );
// }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4B7B7B),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/logo-iscae.png'),
                ),
                // Title
                Container(
                  height: 400,
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  decoration: BoxDecoration(
                  color: const Color(0xFF6B9B9B),
                  borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'CONNEXION',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Bon retour ! Ravi de vous revoir :)',
                        style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ),

                      SizedBox(height:20),
                  
                      // Pssword Textfield
                      TextField(
                        controller: __passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Mot de passe',
                          labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      
                      // Sing in button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                            );
                          },
                          // onTap: signIn,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Connexion',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                             ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}