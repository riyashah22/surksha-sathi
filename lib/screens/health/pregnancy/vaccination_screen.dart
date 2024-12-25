import 'package:flutter/material.dart';
import 'package:suraksha_sathi/theme/theme_ext.dart';

class VaccinationScreen extends StatelessWidget {
  const VaccinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> vaccinations = [
      {
        'month': 'At Birth',
        'vaccine': 'BCG, Hepatitis B, OPV',
        'description':
            'BCG for tuberculosis, Hepatitis B first dose, and OPV zero dose.',
      },
      {
        'month': '6 Weeks',
        'vaccine': 'DPT, Hepatitis B, OPV, Hib, RV, PCV',
        'description':
            'DPT first dose, Hepatitis B second dose, OPV first dose, and others.',
      },
      {
        'month': '10 Weeks',
        'vaccine': 'DPT, Hepatitis B, OPV, Hib, RV, PCV',
        'description':
            'DPT second dose, Hepatitis B third dose, OPV second dose, and others.',
      },
      {
        'month': '14 Weeks',
        'vaccine': 'DPT, Hepatitis B, OPV, Hib, RV, PCV',
        'description':
            'DPT third dose, Hepatitis B fourth dose, OPV third dose, and others.',
      },
      {
        'month': '9 Months',
        'vaccine': 'MR, OPV',
        'description': 'Measles and Rubella vaccine, OPV booster dose.',
      },
      {
        'month': '12-15 Months',
        'vaccine': 'PCV Booster, MR Second Dose',
        'description': 'Pneumococcal booster and second MR dose.',
      },
      {
        'month': '16-24 Months',
        'vaccine': 'DPT Booster, OPV Booster',
        'description': 'First DPT booster and OPV booster.',
      },
      {
        'month': '5-6 Years',
        'vaccine': 'DPT Booster',
        'description': 'Second DPT booster dose.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccination Schedule'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: vaccinations.length,
        itemBuilder: (context, index) {
          final vaccination = vaccinations[index];
          return _buildVaccinationCard(vaccination['month']!,
              vaccination['vaccine']!, vaccination['description']!, context);
        },
      ),
    );
  }

  Widget _buildVaccinationCard(
      String month, String vaccine, String description, BuildContext context) {
    final appColors = context.appColors;
    return Card(
      color: Color(0xfffdfbf9),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: appColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  month,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Vaccine Name: $vaccine',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
