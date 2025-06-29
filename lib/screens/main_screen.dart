import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';
// You can create a transactions_screen.dart later
// import 'transactions_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // For now, Transactions screen can just be a placeholder
  static final List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    const Center(child: Text("Transactions Screen")), // Placeholder
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // Use IndexedStack to preserve state of each screen
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.layoutOutline),
            activeIcon: Icon(EvaIcons.layout),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.swapOutline),
            activeIcon: Icon(EvaIcons.swap),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.personOutline),
            activeIcon: Icon(EvaIcons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Good for 3-5 items
      ),
    );
  }
}