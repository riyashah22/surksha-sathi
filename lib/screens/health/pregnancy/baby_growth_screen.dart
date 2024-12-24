import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BabyGrowthScreen extends StatelessWidget {
  const BabyGrowthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> babyGrowthData = [
      {
        'week': 'Week 1',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4B-Qe-FGV2eaf_UbMeRB-7Ldv1F8m6Ax0xw&s',
        'description':
            'Fertilization has not yet occurred. Your body is preparing for ovulation.',
      },
      {
        'week': 'Week 2',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbEmYR6cuRBfyCIuOzXHNyB4ItJpm9EeWuKQ&s',
        'description':
            'Ovulation happens around this time. The egg is ready to be fertilized.',
      },
      {
        'week': 'Week 3',
        'image':
            'https://images.agoramedia.com/wte3.0/gcms/wbw-your-baby-2021-alt-w03-1200x1200.jpg',
        'description':
            'Fertilization occurs, and the zygote begins dividing and traveling toward the uterus.',
      },
      {
        'week': 'Week 4',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTJsEvs9I7hKqzfOwnyHcGZSHLpWe8ub8E8Q&s',
        'description':
            'The embryo implants into the uterine wall. Hormones signal the beginning of pregnancy.',
      },
      {
        'week': 'Week 5',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEr2Ca7Ihdb84RhjWbkI9SCmeam5uI0y2OwQ&s',
        'description':
            'The baby is now the size of a sesame seed. The heart and circulatory system are developing.',
      },
      {
        'week': 'Week 6',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfRIRoBlOhLQmhaAv1Dy_kP4oUJnjrTvCSuA&s',
        'description':
            'The baby’s heartbeat can be detected. Arms and legs are beginning to form.',
      },
      {
        'week': 'Week 7',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3znFrjuJyNIVS3iKSWnH5xh4YD8ialpeNDA&s',
        'description':
            'The baby is now the size of a blueberry. Facial features and brain development begin.',
      },
      {
        'week': 'Week 8',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3ZghYLIaVEShAnPCVc_4JHCxndeEVEBVISA&s',
        'description':
            'The baby is about the size of a raspberry. Fingers and toes start forming.',
      },
      {
        'week': 'Week 9',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkUzJ0k5_bimudPRWDWGp5aDlk74OQpYaByw&s',
        'description':
            'The baby is the size of a cherry. All major organs are forming.',
      },
      {
        'week': 'Week 10',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSica7cQoAVniyTkPwHzOLHcHyZHYNOGM2YQQ&s',
        'description':
            'The baby is now officially called a fetus and is about the size of a kumquat.',
      },
      {
        'week': 'Week 11',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-utenAnFWMPFllHpoNrHh5DtqbbF14jZCbg&s',
        'description':
            'The baby is the size of a fig. The fingers and toes are no longer webbed.',
      },
      {
        'week': 'Week 12',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzL3akm-yul-NT8SrFG2pwM1IFdMLyqcbczw&s',
        'description':
            'The baby’s organs are functioning, and it’s about the size of a plum.',
      },
      {
        'week': 'Week 13',
        'image':
            'https://images.agoramedia.com/wte3.0/gcms/wbw-your-baby-2021-alt-w13-1200x1200.jpg',
        'description':
            'The baby is growing rapidly and is the size of a lemon. Vocal cords are forming.',
      },
      {
        'week': 'Week 14',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpkRfjGthwEqFCcEP1ClXYrUstfIw0JgbZvg&s',
        'description':
            'The baby is about the size of a peach. Hair is beginning to grow on the head.',
      },
      {
        'week': 'Week 15',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYy3mAyKQD_QnqDOpCliCoYzsGoZQ91w4kqQ&s',
        'description':
            'The baby is the size of an apple. Taste buds and skeletal development continue.',
      },
      {
        'week': 'Week 16 - 20',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4jH8uod4PNwQNQ_hr5dunN9oMW-vaja-XQ&s',
        'description':
            'You might start feeling movements soon. Ears are positioned properly, and hearing starts. The skin is developing a protective coating.You might find out the gender through ultrasound.',
      },
      {
        'week': 'Week 21 - 30',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGlyWIXYTTOUcKCK-qZVfuw41tALO8UGiaHg&s',
        'description':
            'The baby is growing rapidly, with distinct milestones. By week 22, touch develops further, and by week 23, the lungs begin developing air sacs. By week 30, the baby practices breathing and prepares for birth.',
      },
      {
        'week': 'Week 31 - 35',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlhu03_rvuw3kr0N6bpdmkx3SgHu4dKtLxYw&s',
        'description':
            'The baby continues to grow and mature. In week 32, body fat increases, and by week 33, bones harden. By week 35, the baby\'s weight gain accelerates as it prepares for birth.',
      },
      {
        'week': 'Week 36 - 40',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGcyi4b7XIK_w7yww7Ff9XunKKw_n_lMPiUA&s',
        'description':
            'The baby is preparing for birth as it reaches full-term. In week 37, it becomes fully developed, with organs ready for life outside the womb. By week 40, labor could start anytime as the baby is fully matured.',
      },
      {
        'week': 'Week 41',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN1Y7fI_CmYWeZOWYTfqWh1_LXf5aCjB55bw&s',
        'description':
            'The baby might be overdue. Talk to your doctor about induction or other options.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Baby Growth Tracker'),
      ),
      body: Center(
        child: Column(
          children: [
            // Add motivational quote above the carousel
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 40,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.star,
                            size: 40,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.star,
                            size: 40,
                            color: Colors.orange,
                          ),
                          Icon(
                            Icons.star,
                            size: 40,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "“Every week brings new progress, growth, and strength. You and your baby are doing great!”",
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Celebrate the milestones of your baby’s growth!",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            // Carousel slider below the quote
            CarouselSlider.builder(
              itemCount: babyGrowthData.length,
              itemBuilder: (context, index, realIndex) {
                final weekData = babyGrowthData[index];
                return BabyGrowthCard(
                  week: weekData['week']!,
                  imagePath: weekData['image']!,
                  description: weekData['description']!,
                );
              },
              options: CarouselOptions(
                height: 500,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                autoPlay: false,
                viewportFraction: 0.85,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BabyGrowthCard extends StatelessWidget {
  final String week;
  final String imagePath;
  final String description;

  const BabyGrowthCard({
    super.key,
    required this.week,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imagePath,
              height: 250, // Image height remains the same
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  week,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
