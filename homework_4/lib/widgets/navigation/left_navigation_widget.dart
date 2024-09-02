import 'package:flutter/material.dart';

class LeftNavigationWidget extends StatelessWidget {
  const LeftNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      minWidth: 50,
      selectedIndex: 0,
      backgroundColor: const Color(0xfff1e2c3),
      destinations: const [
        NavigationRailDestination(
          label: Text('Заведения'),
          icon: Icon(Icons.local_bar),
          selectedIcon: Icon(Icons.local_bar, color: Colors.deepPurple),
        ),
        NavigationRailDestination(
          label: Text('Отели'),
          icon: Icon(Icons.hotel),
          selectedIcon: Icon(Icons.hotel, color: Colors.deepPurple),
        ),
        NavigationRailDestination(
          label: Text('Пляжи'),
          icon: Icon(Icons.beach_access),
          selectedIcon: Icon(Icons.beach_access, color: Colors.deepPurple),
        ),
      ],
    );
  }
}
