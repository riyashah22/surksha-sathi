import 'package:flutter/material.dart';

class QnaScreen extends StatefulWidget {
  const QnaScreen({super.key});

  @override
  State<QnaScreen> createState() => _QnaScreenState();
}

class _QnaScreenState extends State<QnaScreen> {
  final List<Map<String, String>> _questions = [];
  final TextEditingController _questionController = TextEditingController();

  // Default questions and answers
  @override
  void initState() {
    super.initState();
    _questions.addAll([
      {
        'question': 'What is pregnancy?',
        'answer':
            'Pregnancy is the period during which a fetus develops inside a woman\'s uterus.',
      },
      {
        'question': 'What is the best diet during pregnancy?',
        'answer':
            'A balanced diet rich in fruits, vegetables, and protein is recommended during pregnancy.',
      },
      {
        'question': 'How to exercise during pregnancy?',
        'answer':
            'Consult your doctor before starting any exercise routine during pregnancy. Gentle exercises like walking and yoga are usually safe.',
      },
    ]);
  }

  // Function to add the question to the list
  void _addQuestion() {
    if (_questionController.text.isNotEmpty) {
      setState(() {
        _questions.add({
          'question': _questionController.text,
          'answer': 'Answer will be provided soon...', // Default answer
        });
        _questionController.clear();
      });
    }
  }

  // Function to show the bottom sheet for question input
  void _showAddQuestionDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Question'),
        content: TextField(
          controller: _questionController,
          decoration: const InputDecoration(
            hintText: 'Enter your question',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _addQuestion();
              Navigator.of(ctx).pop();
            },
            child: const Text('Submit'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Q&A Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _questions.length,
          itemBuilder: (ctx, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Q: ${_questions[index]['question']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'A: ${_questions[index]['answer']}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddQuestionDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
