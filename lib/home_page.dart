import 'package:flutter/material.dart';
import 'second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"title": "Drawing Tablet", "icon": Icons.tablet},
      {"title": "Stylus Pen", "icon": Icons.edit},
      {"title": "Digital Canvas", "icon": Icons.brush},
      {"title": "Graphic Monitor", "icon": Icons.monitor},
      {"title": "Pressure Pen", "icon": Icons.gesture},
      {"title": "Pen Display", "icon": Icons.touch_app},
      {"title": "Digital Ruler", "icon": Icons.straighten},
      {"title": "Color Calibration", "icon": Icons.color_lens},
      {"title": "Software Drawing", "icon": Icons.apps},
      {"title": "Shortcut Keypad", "icon": Icons.keyboard},
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
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
