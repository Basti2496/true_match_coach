import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _currentQuestionIndex = 0;
  List<String> _answers = [];
  List<Map<String, dynamic>> _questions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final String jsonString = await rootBundle.loadString('assets/questions.json');
    final List<dynamic> data = json.decode(jsonString);
    setState(() {
      _questions = List<Map<String, dynamic>>.from(data);
      _isLoading = false;
    });
  }

  void _nextQuestion(String answer) {
    setState(() {
      _answers.add(answer);
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.pushReplacementNamed(context, '/result', arguments: _answers);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final current = _questions[_currentQuestionIndex];
    final total = _questions.length;
    final progress = (_currentQuestionIndex + 1) / total;
    return Scaffold(
      appBar: AppBar(title: const Text('Persönlichkeitstest')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          LinearProgressIndicator(value: progress, backgroundColor: Colors.white10, color: Colors.redAccent),
          const SizedBox(height: 12),
          Text('Frage ${_currentQuestionIndex + 1} von $total', style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 24),
          Text(current['question'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ...(current['options'] as List<dynamic>).map((opt) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white10, padding: const EdgeInsets.all(16)),
                onPressed: () => _nextQuestion(opt),
                child: Text(opt),
              ),
            );
          }).toList(),
        ]),
      ),
    );
  }
}