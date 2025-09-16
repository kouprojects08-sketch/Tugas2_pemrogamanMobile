import 'package:flutter/material.dart';

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
        // Seed color ganti ke warna khas Wacom (toska)
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00C4B3)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Digital Art Equipment'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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

    return Scaffold(
      appBar: AppBar(
        // Warna header → warna khas Wacom
        backgroundColor: const Color(0xFF00C4B3),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white, // tulisan header putih biar kontras
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolom
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon pakai warna khas Wacom
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
          );
        },
      ),
    );
  }
}

