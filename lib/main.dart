import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

/// Provider Counter
class CounterProvider with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

/// Root MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Art Equipment',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00C4B3)),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}

/// Main Page dengan Drawer Navigation
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _currentPage = HomePage(); // jangan const
  String _title = 'Home';

  void _selectPage(Widget page, String title) {
    setState(() {
      _currentPage = page;
      _title = title;
    });
    Navigator.pop(context);
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
        centerTitle: true,
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
              onTap: () => _selectPage(HomePage(), 'Home'),
            ),
            ListTile(
              leading: const Icon(Icons.calculate, color: wacomColor),
              title: const Text('Counter'),
              onTap: () => _selectPage(CounterPage(), 'Counter'),
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

/// Halaman Home
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: Center(child: Text("Drawing Tablet")),
        ),
        Card(
          child: Center(child: Text("Stylus Pen")),
        ),
        Card(
          child: Center(child: Text("Monitor")),
        ),
        Card(
          child: Center(child: Text("Software License")),
        ),
      ],
    );
  }
}

/// Halaman Counter
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter: ${counter.counter}", style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: counter.increment,
                child: const Text("Tambah"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: counter.decrement,
                child: const Text("Kurang"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/// Halaman About
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

/// Halaman Contact
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hubungi Kami:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Telp: +62 812 3456 7890"),
            Text("Email: support@digitalart.com"),
          ],
        ),
      ),
    );
  }
}
