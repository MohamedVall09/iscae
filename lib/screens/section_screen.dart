// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:iscae_app/screens/localisation_screen.dart';
import 'package:iscae_app/screens/section_scren.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({super.key});

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  // final user = FirebaseAuth.instance.currentUser!;
  int _selectedTab = 0;
  // int _selectedIndex = 0;

  final List<String> sections = [
    'BD', 'COA', 'DotNet', 'IA', 'JEE', 'SIG', 'SSI', 'WS'
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
                              Text(' '),//${user.email}
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
            const SizedBox(height: 15),
            // التبويبات
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTab(0, Icons.subject, 'Matériaux'),
                  _buildTab(1, Icons.access_time, 'Emplois du temps'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
                decoration: BoxDecoration(
                  color: const Color(0xFF6B9B9B),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: _selectedTab == 0
                    ? GridView.count(
                        crossAxisCount: 3,
                        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 24),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: List.generate(sections.length, (index) {
                          return ElevatedButton(
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
                                    builder: (_) => const SectionScren(),
                                  ),
                                );
                                print('Selected section: ${sections[index]}');
                            },
                            child: Text(
                              sections[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }),
                      )
                    : const Center(
                        child: Text(
                          'Emplois du temps',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black54,
                          ),
                        ),
                      ),
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
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/location');
          }
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

  Widget _buildTab(int index, IconData icon, String label) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.black, size: 28),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}