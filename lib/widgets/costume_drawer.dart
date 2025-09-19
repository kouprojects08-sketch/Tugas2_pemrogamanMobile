import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/second_page.dart';

class CostumeDrawer extends StatelessWidget {
  const CostumeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // warna hijau Wacom
    const Color wacomGreen = Color(0xFF00C4B3);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: wacomGreen, // hijau Wacom di header
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: wacomGreen),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // tutup drawer dulu
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.pages, color: wacomGreen),
            title: const Text('Second Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
