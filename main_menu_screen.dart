import 'package:flutter/material.dart';
import '../auth_module.dart';

class MainMenuScreen extends StatelessWidget {
  Widget buildMenuButton(BuildContext context, String title, String route, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white10, padding: const EdgeInsets.symmetric(vertical: 16)),
        icon: Icon(icon, color: Colors.redAccent),
        label: Text(title, style: const TextStyle(fontSize: 18)),
        onPressed: () => Navigator.pushNamed(context, route),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hauptmenü')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          buildMenuButton(context, '🧠 Persönlichkeitstest', '/questions', Icons.quiz),
          buildMenuButton(context, '📸 Foto-Coach', '/photo', Icons.camera_alt),
          buildMenuButton(context, '💬 Chat-Coach', '/chat', Icons.chat),
          buildMenuButton(context, '🧪 Simulation', '/simulate', Icons.smart_toy),
          buildMenuButton(context, '📂 Mein Profil', '/profile', Icons.person),
          const SizedBox(height: 24),
          const Divider(color: Colors.white30),
          const SizedBox(height: 16),
          buildMenuButton(context, '🔐 Login / Registrierung', '/auth', Icons.lock),
        ]),
      ),
    );
  }
}