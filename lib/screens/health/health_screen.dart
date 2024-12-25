import 'package:flutter/material.dart';
import 'package:suraksha_sathi/screens/health/period/period_screen.dart';
import 'package:suraksha_sathi/screens/health/pregnancy_screen.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Tips'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PeriodScreen()),
                );
              },
              child: _buildCard('Periods',
                  'https://images.herzindagi.info/image/2022/Sep/women-talk-about-first-periods.jpg'),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PregnancyScreen()),
                );
              },
              child: _buildCard('Pregnancy',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS47TqoBBGRM1XwqqtbvxNJv_JG_2Jq0bI7hg&s'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String imagePath) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
