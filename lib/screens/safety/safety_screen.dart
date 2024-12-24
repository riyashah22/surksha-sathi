import 'package:flutter/material.dart';
import 'package:suraksha_sathi/theme/theme_ext.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  final List<Map<String, String>> safetyKits = const [
    {
      'name': 'Pepper Spray',
      'image':
          'https://cdn.farmako.in/inventory/images/806363771a9d5a050ed8618966a487b5a18285b4/239dfee45742358cbfe0734af096b37b65222398.png'
    },
    {
      'name': 'Red Chilli Powder',
      'image':
          'https://static.vecteezy.com/system/resources/previews/044/625/014/non_2x/3d-rendering-of-a-red-chili-powder-on-transparent-background-free-png.png'
    },
    {
      'name': 'Whistle',
      'image':
          'https://w7.pngwing.com/pngs/558/137/png-transparent-amazon-com-whistle-safety-fox-40-association-football-referee-whistle-miscellaneous-blue-police-officer.png'
    },
    {
      'name': 'Pocket Knife',
      'image':
          'https://e7.pngegg.com/pngimages/999/1000/png-clipart-utility-knives-hunting-survival-knives-knife-sog-specialty-knives-tools-llc-serrated-blade-folding-angle-shield.png'
    },
    {
      'name': 'Taser',
      'image':
          'https://www.euro-security.info/images/stories/stun-guns/stun-gun-power-200.png'
    },
    {
      'name': 'Safety Alarm',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAUWUiJdP0e35vRUGOfiQsE8M5PsSumCFJSA&s'
    },
    {
      'name': 'Flashlight',
      'image':
          'https://static.vecteezy.com/system/resources/previews/021/095/665/non_2x/3d-render-flashlight-icon-illustration-suitable-for-safety-design-themes-user-manual-themes-web-app-etc-png.png'
    },
    {
      'name': 'First Aid Kit',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTr-wCrIrMClKK9DoeH9IXz4Z3dTVGlUAQRA&s'
    },
    {
      'name': 'Personal Tracker',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3MlkOdQPpDfXZY05rdC3ziTRCOCYJ40WEzg&s'
    },
    {
      'name': 'Emergency Contact Card',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf9fa55e_WN5uAJvInTBktio4VOF_VJKvEIA&s'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Measures'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.share_location_outlined,
              size: 30,
              color: appColors.primary,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: safetyKits.length,
          itemBuilder: (context, index) {
            final item = safetyKits[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(item['image']!),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item['name']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(
          "SOS",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
