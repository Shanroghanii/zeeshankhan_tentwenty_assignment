import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../home/home.dart';
import '../watch/watch_screen.dart';
import 'navbar_notifier.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: provider.selectedIndex,
        children: const [
          DashboardScreen(),
          WatchScreen(),
          SizedBox(),
          SizedBox(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, provider),
    );
  }

  Widget _buildBottomNavigationBar(
      BuildContext context, NavigationProvider provider) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      child: BottomNavigationBar(
        onTap: provider.updateSelectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor, // Replace with your color
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: provider.selectedIndex,
        items: [
          _buildNavItem(Icons.dashboard_outlined, 'Dashboard'),
          _buildNavItem(CupertinoIcons.play_rectangle_fill, 'Watch'),
          _buildNavItem(Icons.library_books_outlined, 'Media Library'),
          _buildNavItem(Icons.menu, 'More'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(icon),
      ),
      label: label,
    );
  }
}
