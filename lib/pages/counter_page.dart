import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void increment() => setState(() => counter++);
  void decrement() => setState(() => counter--);

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color(0xFF00C4B3);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
        backgroundColor: mainColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Counter Value :",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Increment (filled, teks putih)
            ElevatedButton(
              onPressed: increment,
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Increment Counter",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 10),

            // Tombol Decrement — teks putih agar kontras dan tidak "nyaru"
            ElevatedButton(
              onPressed: decrement,
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor, // buat kontras dengan teks putih
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: mainColor),
                ),
              ),
              child: const Text(
                "Decrement Counter",
                style: TextStyle(color: Colors.white), // <-- perubahan utama
              ),
            ),
          ],
        ),
      ),
    );
  }
}
