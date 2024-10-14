import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem {
  final IconData icon;
  final String label;
  const CustomBottomNavigationBarItem({required this.icon, required this.label});
}

class CustomBottomNavigationBarColors {
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  const CustomBottomNavigationBarColors({required this.backgroundColor, required this.selectedItemColor, required this.unselectedItemColor});
}

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomBottomNavigationBarItem> items;
  final CustomBottomNavigationBarColors colors;
  final Function onChangePage;
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.items, required this.colors, required this.onChangePage, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: colors.backgroundColor,
      selectedItemColor: colors.selectedItemColor,
      unselectedItemColor: colors.unselectedItemColor,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        onChangePage(index);
      },
      items: items.map((item) => BottomNavigationBarItem(
        icon: Icon(item.icon),
        label: item.label
      )).toList()
    );
  }
}