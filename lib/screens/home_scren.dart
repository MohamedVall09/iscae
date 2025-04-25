// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iscae_app/screens/localisation_screen.dart';
import 'package:iscae_app/screens/section_screen.dart';


class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  // final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  // الأقسام
  final List<String> sections = [
    'S1', 'S2', 'S3', 'S4', 'S5', 'S6'
  ];

  bool con = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4B7B7B),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).maybePop(); 
                    setState(() {
                      con = true;
                    });
                  }
                ),
                
                IconButton(
                  icon: const Icon(Icons.account_circle, color: Colors.black),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xFF4B7B7B),
                          title: Center(child: const Text('Profil')),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               Text(''), //${user.email}
                              const SizedBox(height: 20),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // FirebaseAuth.instance.signOut();
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.logout, color: Colors.white),
                                label: const Text('Déconnexion'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/logo-iscae.png'),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 23.5),
                padding: const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  color: const Color(0xFF6B9B9B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24), 
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: _selectedIndex == 0
                    ? ListView.builder(
                        itemCount: sections.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4B7B7B),
                                foregroundColor: Colors.black,
                                side: const BorderSide(color: Colors.black),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SectionScreen(),
                                  ),
                                );
                                print('Selected section: ${sections[index]}');
                              },
                              child: Text(
                                sections[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    :  LocalisationScreen(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF6B9B9B),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: 0, // أو حسب الحالة
        onTap: (index) {
            Navigator.pushReplacementNamed(context, '/home');
          
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Localisation',
          ),
        ],
      ),

    );
  }
}
