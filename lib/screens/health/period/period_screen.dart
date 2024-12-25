import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suraksha_sathi/screens/health/pregnancy/vaccination_screen.dart';
import 'package:suraksha_sathi/theme/theme_ext.dart';

class PeriodScreen extends StatefulWidget {
  const PeriodScreen({super.key});

  @override
  State<PeriodScreen> createState() => _PeriodScreenState();
}

class _PeriodScreenState extends State<PeriodScreen> {
  DateTime? lastPeriodDate;
  int cycleDays = 28; // Default cycle length
  bool isFirstVisit = true; // This can be managed with persistent storage later
  bool showRemedies = false; // To toggle remedies section

  final List<Map<String, String>> remedies = [
    {
      "title": "Heat Therapy",
      "description":
          "Applying heat to the lower abdomen helps relax the muscles, reducing cramps and pain.",
      "imagePath":
          "https://complete-physio.co.uk/wp-content/uploads/2020/12/hot-or-cold-3.jpg"
    },
    {
      "title": "Hydration",
      "description":
          "Staying hydrated can reduce bloating and improve circulation to alleviate cramps.",
      "imagePath":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7hEi1DVbU9Xzp1nAhpzFBM9_4YcIvZWjSvw&s"
    },
    {
      "title": "Yoga and Stretching",
      "description":
          "Gentle yoga poses and stretches can reduce tension and provide pain relief during menstruation.",
      "imagePath":
          "https://www.doyou.com/wp-content/uploads/2021/01/try-these-9-yoga-poses-for-a-good-upper-body-stretch-80297-1.jpg"
    },
    {
      "title": "Herbal Tea",
      "description":
          "Chamomile or ginger tea can help relax muscles and reduce inflammation during periods.",
      "imagePath":
          "https://teaandleaves.co.uk/cdn/shop/collections/Double_Walled_Tea.jpg?v=1700649867"
    },
    {
      "title": "Over-the-Counter Medication",
      "description":
          "Non-prescription pain relievers like ibuprofen or aspirin can provide quick relief.",
      "imagePath":
          "https://ayurvalley.com/wp-content/uploads/2018/09/Levels-of-Meditation.jpg"
    },
    {
      "title": "Aromatherapy",
      "description":
          "Essential oils like lavender can have a calming effect, reducing stress and discomfort.",
      "imagePath":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNJQYR88a0srOCk5laHHOI8nYKx0_p3THpgg&s"
    },
  ];

  @override
  void initState() {
    super.initState();
    if (isFirstVisit) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showInitialQuestions(context);
      });
    }
  }

  void _showInitialQuestions(BuildContext context) {
    final appColors = context.appColors;
    DateTime selectedDate = DateTime.now();
    TextEditingController cycleController =
        TextEditingController(text: cycleDays.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xfffdfbf9),
          title: const Text('Enter Your Cycle Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Last Period Date'),
                subtitle: Text(DateFormat.yMMMd().format(selectedDate)),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary:
                                  appColors.primary, // Header background color
                              onPrimary: Colors.white, // Header text color
                              onSurface: Colors.black, // Body text color
                            ),
                            dialogBackgroundColor: Colors
                                .pink[50], // Background color of the dialog
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (pickedDate != null) {
                      setState(() => selectedDate = pickedDate);
                    }
                  },
                ),
              ),
              TextField(
                controller: cycleController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Cycle Length (days)',
                  hintText: 'e.g., 28',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (cycleController.text.isNotEmpty) {
                  setState(() {
                    lastPeriodDate = selectedDate; // Update last period date
                    cycleDays =
                        int.parse(cycleController.text); // Update cycle days
                    isFirstVisit = false; // Update visit status
                    showRemedies = true; // Show remedies section
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showRemedyDetails(Map<String, String> remedy) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(remedy['title']!),
          content: Text(remedy['description']!),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime? nextPeriodDate = lastPeriodDate?.add(Duration(days: cycleDays));
    final appColors = context.appColors;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            if (nextPeriodDate != null)
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: appColors.secondary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: appColors.primary,
                    width: 4.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Prediction: Period',
                      style: TextStyle(
                        fontSize: 16,
                        color: appColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Day ${DateTime.now().difference(lastPeriodDate!).inDays + 1}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Next: ${DateFormat.yMMMd().format(nextPeriodDate)}',
                      style: TextStyle(
                          fontSize: 14,
                          color: appColors.primary,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showInitialQuestions(context);
              },
              child: const Text('Edit Period Dates'),
            ),
            const SizedBox(height: 20),
            if (showRemedies) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pain Relief Home Remedies',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1, // Adjust square shape
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: remedies.length,
                itemBuilder: (context, index) {
                  final remedy = remedies[index];
                  return GestureDetector(
                    onTap: () => _showRemedyDetails(remedy),
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              remedy['imagePath']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              remedy['title']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
