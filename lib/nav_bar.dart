import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:suraksha_sathi/screens/health/health_screen.dart';
import 'package:suraksha_sathi/screens/policy/policy_screen.dart';
import 'package:suraksha_sathi/screens/safety/safety_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (int index) {
                controller.changeIndex(index); // Handle index change
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(
                    Icons.health_and_safety,
                    color: Colors.green,
                  ),
                  label: "Safety",
                ),
                NavigationDestination(
                  icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedPolicy, color: Colors.green),
                  label: "Policy",
                ),
                NavigationDestination(
                  icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedHealth, color: Colors.green),
                  label: "Health",
                ),
              ])),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const SafetyScreen(),
    const PolicyScreen(),
    const HealthScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
