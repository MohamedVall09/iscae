import 'package:flutter/material.dart';
import 'package:iscae_app/screens/home_scren.dart';
import 'package:iscae_app/screens/localisation_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  // الأقسام
  final List<String> sections = [
    'FC', 'BA', 'DI', 'IG', 'RT', 'GRH', 'TCM', 'SAI'
  ];

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
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    final RenderBox button = context.findRenderObject() as RenderBox;
                    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
                    final Offset position = button.localToGlobal(Offset.zero, ancestor: overlay);

                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(position.dx, position.dy + 40, 20, 0),
                      items: [
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(Icons.home, color: Colors.black),
                            title: const Text('Accueil'),
                            onTap: () {
                              Navigator.pop(context); 
                              Navigator.pushNamed(context, '/home');
                            },
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(Icons.location_on, color: Colors.black),
                            title: const Text('Localisation'),
                            onTap: () {
                              Navigator.pop(context); 
                              Navigator.pushNamed(context, '/location');
                            },
                          ),
                        ),
                      ],
                      color: const Color(0xFF6B9B9B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.black12),
                      ),
                    );
                  },
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
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                padding: const EdgeInsets.symmetric(vertical: 26),
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
                                    builder: (_) => const HomeScren(),
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
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
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
