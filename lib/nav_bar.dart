import 'package:dot_bottom_nav_bar/view/dot_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:suraksha_sathi/screens/health/health_screen.dart';
import 'package:suraksha_sathi/screens/policy/policy_screen.dart';
import 'package:suraksha_sathi/screens/safety/safety_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectIndex = 0;
  List<Widget> _modules = const [
    SafetyScreen(),
    PolicyScreen(),
    HealthScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: _modules[selectIndex],
      bottomNavigationBar: DotBottomNavBar(
        // backgroundColor: Colors.transparent,
        // selectedColor: appColors.primary,
        // dotColor: appColors.primary,
        currentIndex: selectIndex,
        onTap: (value) {
          setState(() {
            selectIndex = value;
          });
        },
        items: [
          BottomNavItem(
            emptySvg: "assets/outline/safety.svg",
            fillSvg: "assets/fill/safety.svg",
            label: "Safety",
          ),
          BottomNavItem(
            emptySvg: "assets/outline/policy.svg",
            fillSvg: "assets/fill/policy.svg",
            label: "Policy",
          ),
          BottomNavItem(
            emptySvg: "assets/outline/medkit.svg",
            fillSvg: "assets/fill/medkit.svg",
            label: "Health",
          ),
        ],
      ),
    );
  }
}
