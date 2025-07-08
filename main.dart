import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/welcome_screen.dart';
import 'screens/main_menu_screen.dart';
import 'screens/questions_screen.dart';
import 'screens/result_screen.dart';
import 'screens/photo_coach_screen.dart';
import 'screens/chat_coach_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/simulation_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrueMatch Coach',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.redAccent,
          secondary: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/menu': (context) => MainMenuScreen(),
        '/questions': (context) => QuestionsScreen(),
        '/result': (context) => ResultScreen(),
        '/photo': (context) => PhotoCoachScreen(),
        '/chat': (context) => ChatCoachScreen(),
        '/profile': (context) => ProfileScreen(),
        '/simulate': (context) => SimulationScreen(),
        '/auth': (context) => AuthModule(),
      },
    );
  }
}