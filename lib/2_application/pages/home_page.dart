import 'package:flutter/material.dart';
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
    const SalesPageWrapperProvider(),
    // Add more screens as needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('MyApp'),
        // ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            // Add more items for additional screens
          ],
        ),
      ),
    );
  }
}
