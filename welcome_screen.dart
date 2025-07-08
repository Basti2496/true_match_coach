import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _selectedLanguage = 'Deutsch 🇩🇪';
  final List<String> _languages = ['Deutsch 🇩🇪', 'Englisch (US) 🇺🇸', 'Englisch (UK) 🇬🇧', 'Italienisch 🇮🇹', 'Spanisch 🇪🇸', 'Französisch 🇫🇷', 'Griechisch 🇬🇷', 'Türkisch 🇹🇷'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black, Colors.redAccent], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        padding: const EdgeInsets.all(24.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text('TrueMatch Coach', textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 24),
          DropdownButtonFormField<String>(
            dropdownColor: Colors.black87,
            decoration: InputDecoration(filled: true, fillColor: Colors.white10, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            value: _selectedLanguage,
            items: _languages.map((lang) {
              return DropdownMenuItem(value: lang, child: Text(lang, style: const TextStyle(color: Colors.white)));
            }).toList(),
            onChanged: (value) {
              setState(() => _selectedLanguage = value!);
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, padding: const EdgeInsets.symmetric(vertical: 16)), onPressed: () => Navigator.pushNamed(context, '/menu'), child: const Text('Los geht’s', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ]),
      ),
    );
  }
}