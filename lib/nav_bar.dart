import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:suraksha_sathi/screens/chatbot/chatbot_screen.dart';
import 'package:suraksha_sathi/screens/health/health_screen.dart';
import 'package:suraksha_sathi/screens/policy/policy_screen.dart';
import 'package:suraksha_sathi/screens/safety/safety_screen.dart';
import 'package:suraksha_sathi/theme/theme_ext.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    final appColors = context.appColors;
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (int index) {
                controller.changeIndex(index); // Handle index change
              },
              destinations: [
                NavigationDestination(
                  icon: Icon(
                    Icons.health_and_safety,
                    color: appColors.primary,
                  ),
                  label: "Safety",
                ),
                NavigationDestination(
                  icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedPolicy,
                    color: appColors.primary,
                  ),
                  label: "Policy",
                ),
                NavigationDestination(
                  icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedHealth,
                    color: appColors.primary,
                  ),
                  label: "Health",
                ),
                NavigationDestination(
                  icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedBot,
                    color: appColors.primary,
                  ),
                  label: "Chatbot",
                ),
              ])),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const SafetyScreen(),
    PolicyScreen(),
    const HealthScreen(),
    ChatbotScreen()
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
