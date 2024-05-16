import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/view/cloud_sales_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales/view/sales_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const name = 'home';
  static const path = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const SalesPageWrapperProvider(),
    const CloudSalesPageWrapperProvider(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.fire),
            label: 'Firebase',
          ),
        ],
      ),
    );
  }
}
