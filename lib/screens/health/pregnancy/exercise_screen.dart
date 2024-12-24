import 'package:flutter/material.dart';
import 'package:suraksha_sathi/screens/safety/safety_screen.dart';
import 'package:suraksha_sathi/theme/theme_ext.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  String filter = 'Post Pregnancy'; // Default filter

  // Sample video data
  final List<Map<String, String>> videoData = [
    {
      'type': 'Post Pregnancy',
      'title': 'Post Pregnancy Yoga',
      'image':
          'https://img.freepik.com/free-photo/yoga-training-mat_23-2147998947.jpg',
      'url': 'https://www.youtube.com/watch?v=post_pregnancy_yoga',
    },
    {
      'type': 'Post Pregnancy',
      'title': 'Stretching After Pregnancy',
      'image':
          'https://img.freepik.com/free-photo/woman-stretching_23-2149156476.jpg',
      'url': 'https://www.youtube.com/watch?v=post_pregnancy_stretching',
    },
    {
      'type': 'Pre Pregnancy',
      'title': 'Prenatal Yoga Tips',
      'image':
          'https://img.freepik.com/free-photo/yoga-meditation_23-2149174307.jpg',
      'url': 'https://www.youtube.com/watch?v=prenatal_yoga_tips',
    },
    {
      'type': 'Pre Pregnancy',
      'title': 'Exercise for Healthy Pregnancy',
      'image':
          'https://img.freepik.com/free-photo/woman-doing-exercise_23-2149347134.jpg',
      'url': 'https://www.youtube.com/watch?v=healthy_pregnancy_exercise',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filtered video list
    final filteredVideos =
        videoData.where((video) => video['type'] == filter).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Tips'),
      ),
      body: Column(
        children: [
          // Filter buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFilterButton('Post Pregnancy', context),
                const SizedBox(width: 16),
                _buildFilterButton('Pre Pregnancy', context),
              ],
            ),
          ),
          // Video list
          Expanded(
            child: ListView.builder(
              itemCount: filteredVideos.length,
              itemBuilder: (context, index) {
                final video = filteredVideos[index];
                return _buildVideoCard(
                    video['title']!, video['image']!, video['url']!);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String filterType, BuildContext context) {
    final appColors = context.appColors;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          filter = filterType;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: filter == filterType ? appColors.primary : Colors.grey,
      ),
      child: Text(filterType),
    );
  }

  Widget _buildVideoCard(String title, String imageUrl, String videoUrl) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Thumbnail image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 32),
          // Title and button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    final uri = Uri.parse(videoUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Could not launch URL')),
                      );
                    }
                  },
                  child: const Text('Watch Video'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
