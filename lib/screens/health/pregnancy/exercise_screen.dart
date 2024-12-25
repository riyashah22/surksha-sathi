import 'package:flutter/material.dart';
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
          'https://i.ytimg.com/vi/U87i7QVa17I/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AH-CYAC0AWKAgwIABABGGUgXyhYMA8=&rs=AOn4CLAYqKqwH77rfpzsMDeaoTTJc2uqbg',
      'url': 'https://www.youtube.com/watch?v=s1bygpnK7fk',
    },
    {
      'type': 'Post Pregnancy',
      'title': 'Stretching After Pregnancy',
      'image':
          'https://kajabi-storefronts-production.global.ssl.fastly.net/kajabi-storefronts-production/blogs/24773/images/RXRpMckES9qPZ73B2Ksk_Seated_piriformis_stretch.jpg',
      'url': 'https://www.youtube.com/watch?v=aJhIsYrNCVc',
    },
    {
      'type': 'Pre Pregnancy',
      'title': 'Prenatal Yoga Tips',
      'image':
          'https://thumbs.dreamstime.com/b/pregnant-woman-doing-warrior-two-yoga-pose-home-healthy-pregnancy-fitness-concept-young-working-out-cozy-living-room-74188328.jpg',
      'url': 'https://www.youtube.com/watch?v=CEEKapabI0o',
    },
    {
      'type': 'Pre Pregnancy',
      'title': 'Exercise for Healthy Pregnancy',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn7PxP1Mqaxdw95FdGdoz2jxvbB1vdh9NDVw&s',
      'url': 'https://www.youtube.com/watch?v=7cVluhGjz7Y',
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
          const SizedBox(
            height: 24,
          ),
          // Filter buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFilterButton('Post Pregnancy', context),
                const SizedBox(width: 16),
                _buildFilterButton('Pre Pregnancy', context),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
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
      color: const Color(0xfffdfbf9),
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Thumbnail image
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.fill,
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
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    _launchUrl(videoUrl);
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

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
