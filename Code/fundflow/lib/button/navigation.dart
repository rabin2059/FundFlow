import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundflow/screens/add.dart';
import 'package:fundflow/screens/home.dart';
import 'package:fundflow/screens/report.dart';
import 'package:fundflow/screens/screen2.0/itemadd.dart';
import 'package:fundflow/screens/setting.dart';

class ButtonNavigation extends StatefulWidget {
  final String username;

  const ButtonNavigation({Key? key, required this.username}) : super(key: key);

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentPage,
        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.add, color: Colors.white),
          Icon(CupertinoIcons.chart_pie_fill, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        color: Color.fromARGB(255, 0, 0, 0),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
      ),
      body: _getPage(_currentPage),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return AddFund(username: widget.username);
      case 1:
        return AddItems(username: widget.username);
      case 2:
        return ReportScreen(username: widget.username);
      case 3:
        return SettingScreen(username: widget.username);
      default:
        return Container(); // You can return a default empty container or handle the case differently
    }
  }
}
