import 'package:flutter/material.dart';
import '../pages/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"title": "Drawing Tablet", "icon": Icons.tablet},
      {"title": "Stylus Pen", "icon": Icons.edit},
      {"title": "Monitor", "icon": Icons.monitor},
      {"title": "Software License", "icon": Icons.apps},
      {"title": "Graphic Tablet Stand", "icon": Icons.computer},
      {"title": "Tablet Cover", "icon": Icons.tablet_mac},
      {"title": "USB-C Hub", "icon": Icons.usb},
      {"title": "Laptop / PC", "icon": Icons.laptop},
      {"title": "External Hard Drive", "icon": Icons.storage},
      {"title": "Digital Art Gloves", "icon": Icons.pan_tool},
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10, // jumlah kolom
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.2,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item['icon'],
                  size: 48,
                  color: const Color(0xFF00C4B3),
                ),
                const SizedBox(height: 8),
                Text(
                  item['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
