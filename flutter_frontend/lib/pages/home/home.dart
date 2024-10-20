import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/pages/home/dashboard/dashboard.dart';
import 'package:flutter_frontend/pages/home/goal_tracking/goal_tracking.dart';
import 'package:flutter_frontend/pages/home/investment/investment.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SpitHome extends StatefulWidget {
  const SpitHome({super.key});

  @override
  State<SpitHome> createState() => _SpitHomeState();
}

class _SpitHomeState extends State<SpitHome> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const SpitDashboard(),
    const SpitInvestment(),
    const SpitGoalTracking()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.house,
              size: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.handHoldingDollar, size: 20),
            label: 'Investment',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bullseye, size: 20),
            label: 'Goals',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: subTextColor,
        onTap: _onItemTapped,
      ),
    );
  }
}