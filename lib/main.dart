import 'package:flutter/material.dart';
import 'home_page.dart';
import 'second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Art Equipment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00C4B3)),
        useMaterial3: true,
      ),
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
  // untuk ganti konten
  Widget _currentPage = const HomePage();
  String _title = 'Home';

  void _selectPage(Widget page, String title) {
    setState(() {
      _currentPage = page;
      _title = title;
    });
    Navigator.pop(context); // tutup drawer setelah pilih menu
  }

  @override
  Widget build(BuildContext context) {
    const wacomColor = Color(0xFF00C4B3);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: wacomColor,
        title: Text(
          _title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // tombol bulat di kanan header
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tombol bulat ditekan')),
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.settings, color: wacomColor),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: wacomColor),
              child: Text(
                'Menu Navigasi',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: wacomColor),
              title: const Text('Home'),
              onTap: () => _selectPage(const HomePage(), 'Home'),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: wacomColor),
              title: const Text('About'),
              onTap: () => _selectPage(const AboutPage(), 'About'),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail, color: wacomColor),
              title: const Text('Contact'),
              onTap: () => _selectPage(const ContactPage(), 'Contact'),
            ),
          ],
        ),
      ),
      body: _currentPage,
    );
  }
}

/// Halaman About
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ini halaman About', style: TextStyle(fontSize: 18)),
    );
  }
}

/// Halaman Contact
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ini halaman Contact', style: TextStyle(fontSize: 18)),
    );
  }
}
