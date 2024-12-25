import 'package:flutter/material.dart';
import 'package:suraksha_sathi/screens/health/pregnancy/Qna_screen.dart';
import 'package:suraksha_sathi/screens/health/pregnancy/baby_growth_screen.dart';
import 'package:suraksha_sathi/screens/health/pregnancy/exercise_screen.dart';
import 'package:suraksha_sathi/screens/health/pregnancy/vaccination_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class PregnancyScreen extends StatelessWidget {
  const PregnancyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pregnancy Tips'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8, // Adjust this to control the height
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            final cards = [
              {
                'title': 'Exercise',
                'image':
                    'https://img.freepik.com/premium-vector/young-woman-workout-yoga-mat_131590-228.jpg?semt=ais_hybrid',
                'route': const ExerciseScreen(), // Add route here
              },
              {
                'title': 'Vaccination',
                'image':
                    'https://cdn-icons-png.flaticon.com/512/6205/6205025.png',
                'route':
                    const VaccinationScreen(), // Update with the respective route
              },
              {
                'title': 'Baby Growth',
                'image':
                    'https://static.vecteezy.com/system/resources/thumbnails/048/726/146/small_2x/a-fetus-is-depicted-curled-up-inside-the-womb-portrayed-with-shades-of-red-and-pink-png.png',
                'route':
                    const BabyGrowthScreen(), // Update with the respective route
              },
              {
                'title': 'Doctor  Consultation',
                'image':
                    'https://www.qural.app/pediatrician-consultation/assest/img/doctor.png',
                'route':
                    'https://www.practo.com/bangalore/doctors-for-pregnant', // URL for the consultation
              },
              {
                'title': 'Articles',
                'image':
                    'https://static.vecteezy.com/system/resources/thumbnails/009/315/272/small/white-clipboard-task-management-todo-check-list-efficient-work-on-project-plan-fast-progress-level-up-concept-assignment-and-exam-productivity-solution-icon-3d-clipboard-render-free-png.png',
                'route':
                    'https://allohopefoundation.org/learn/pregnancy-week-by-week/?www.allohopefoundation.org&gad_source=1&gclid=Cj0KCQiA1Km7BhC9ARIsAFZfEItQZS4LB9Cp-I_gAbfdY0g9eENBVnVnJ0DXA539yBySpry8fVRkzT8aAtzGEALw_wcB', // Update with the respective route
              },
              {
                'title': 'Q & A',
                'image':
                    'https://atlas-content-cdn.pixelsquid.com/stock-images/stickman-thinking-o0L0VQ1-600.jpg',
                'route': const QnaScreen(), // Update with the respective route
              },
            ];

            final card = cards[index];

            return GestureDetector(
              onTap: () {
                if (card['route'] != null) {
                  if (card['route'] is String) {
                    _launchURL(card['route'] as String);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => card['route'] as Widget,
                      ),
                    );
                  }
                }
              },
              child: _buildCard(
                  card['title'].toString(), card['image'].toString()),
            );
          },
        ),
      ),
    );
  }

  // Method to launch a URL

  Future<void> _launchURL(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }

  Widget _buildCard(String title, String imagePath) {
    return Card(
      color: Color(0xfffdfbf9),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: 120, // Adjust based on your design
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.contain, // Ensures the image fits well
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
