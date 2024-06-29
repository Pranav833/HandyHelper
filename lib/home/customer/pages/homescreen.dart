import 'package:flutter/material.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/home/customer/tabs/dashboard.dart';
import 'package:handy_helper_main/home/customer/tabs/orders.dart';
import 'package:handy_helper_main/home/customer/tabs/profile.dart';

class UHomeScreen extends StatefulWidget {
  @override
  _UHomeScreenState createState() => _UHomeScreenState();
}

class _UHomeScreenState extends State<UHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    CPreviousOrdersScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: AppConst.kBkDark,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: AppConst.kBkDark,
            ),
            label: 'Previous Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: AppConst.kBkDark,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
