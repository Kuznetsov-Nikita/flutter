import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xfff1e2c3),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.local_bar),
          label: 'Заведения',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.hotel),
          label: 'Отели',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.beach_access),
          label: 'Пляжи',
        ),
      ],
    );
  }
}
