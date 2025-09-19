import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Aplikasi ini dibuat untuk menampilkan daftar alat digital art,\n'
          'dilengkapi dengan fitur counter sederhana,\n'
          'serta informasi About & Contact.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
