import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SewaKamarPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff1D2A44),

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(icon: Icon(Icons.hotel), label: 'Sewa'),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 30),

            const Text(
              "TRAVEL GO",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                children: [
                  kamarBox('https://picsum.photos/300/400?random=1'),

                  kamarBox('https://picsum.photos/300/400?random=2'),

                  kamarBox('https://picsum.photos/300/400?random=3'),

                  kamarBox('https://picsum.photos/300/400?random=4'),

                  kamarBox('https://picsum.photos/300/400?random=5'),

                  kamarBox('https://picsum.photos/300/400?random=6'),

                  kamarBox('https://picsum.photos/300/400?random=7'),

                  kamarBox('https://picsum.photos/300/400?random=8'),

                  kamarBox('https://picsum.photos/300/400?random=9'),

                  kamarBox('https://picsum.photos/300/400?random=10'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget kamarBox(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),

        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
    );
  }
}

class SewaKamarPage extends StatelessWidget {
  const SewaKamarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 30),

            const Text(
              "TRAVEL GO",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Container(
              height: 300,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),

                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/600/400'),
                  fit: BoxFit.cover,
                ),

                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black26,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: 220,
              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1D2A44),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Kamar berhasil disewa")),
                  );
                },

                child: const Text(
                  "Sewa Sekarang",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget profileItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Row(
        children: [
          Icon(icon, color: Colors.lightBlue),

          const SizedBox(width: 20),

          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,

              decoration: const BoxDecoration(
                color: Color(0xffE9EEF9),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(120),
                  bottomRight: Radius.circular(120),
                ),
              ),

              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 20),

                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Transform.translate(
              offset: const Offset(0, -50),

              child: const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,

                child: Icon(
                  Icons.person_outline,
                  size: 60,
                  color: Colors.lightBlue,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Column(
                children: [
                  profileItem(Icons.person_outline, "PAB 2025"),

                  profileItem(Icons.phone_outlined, "146210012345"),

                  profileItem(Icons.email_outlined, "pab2023@gmail.com"),

                  profileItem(Icons.location_on_outlined, "Surabaya"),

                  profileItem(Icons.camera_alt_outlined, "pab2023"),
                ],
              ),
            ),

            const SizedBox(height: 40),

            Container(
              height: 180,
              width: double.infinity,

              decoration: const BoxDecoration(
                color: Color(0xffE9EEF9),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(120),
                  topRight: Radius.circular(120),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
