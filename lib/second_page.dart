import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key}); // tambahkan const dan super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Kembali ke Halaman Utama"),
        ),
      ),
    );
  }
}
