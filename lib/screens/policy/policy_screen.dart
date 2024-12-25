import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PolicyScreen extends StatelessWidget {
  PolicyScreen({super.key});

  final List<Map<String, String>> policies = const [
    {
      'title': 'Nirbhaya Fund',
      'description':
          'The Nirbhaya Fund was established to enhance women\'s safety and security by supporting initiatives like self-defense training, CCTVs in public places, and helpline numbers.',
      'url': 'https://www.youtube.com'
    },
    {
      'title': 'Women Helpline Scheme',
      'description':
          'This scheme provides a 24-hour toll-free helpline (181) to help women in distress and provide immediate support services.',
      'url': 'https://wcd.nic.in/schemes/women-helpline-scheme'
    },
    {
      'title': 'One Stop Centre Scheme',
      'description':
          'One Stop Centres, also known as Sakhi Centres, support women affected by violence. Services include legal aid, counseling, and temporary shelter.',
      'url': 'https://wcd.nic.in/schemes/one-stop-centre-scheme'
    },
    {
      'title': 'Mahila Police Volunteers',
      'description':
          'This initiative encourages community participation by connecting women with the police system to ensure timely reporting of crimes against women.',
      'url': 'https://wcd.nic.in/schemes/mahila-police-volunteers'
    },
    {
      'title': 'Ujjawala Scheme',
      'description':
          'The Ujjawala Scheme aims to prevent trafficking and rescue, rehabilitate, and reintegrate victims of trafficking for commercial sexual exploitation.',
      'url': 'https://wcd.nic.in/schemes/ujjawala'
    },
  ];

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse('$url'))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Policies for Women Safety'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: policies.length,
        itemBuilder: (context, index) {
          final policy = policies[index];
          return Card(
            color: Color(0xfffdfbf9),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ExpansionTile(
              title: Text(
                policy['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    policy['description']!,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                TextButton(
                  onPressed: () => _launchUrl(policy['url']!),
                  child: const Text(
                    'Learn More',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
