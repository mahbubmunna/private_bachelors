import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:privatebachelors/pages/notification_page.dart';
import 'add-bill_page.dart';
import 'balance_page.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 1;
  Widget _currentPage = BalancePage();
  String _appbarTitle = 'Balance';
  static const List<String> _tabNames = <String> [
    'Notifications',
    'Balance',
    'Add Bills'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _appbarTitle = _tabNames[index];
      switch(index) {
        case 0:
          _currentPage = NotificationPage();
          break;
        case 1:
          _currentPage = BalancePage();
          break;
        case 2:
          _currentPage = AddBillPage();
      }
    });
  }

  void _openCalender() {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text(_tabNames[0])
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text(_tabNames[1])
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            title: Text(_tabNames[2])
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
