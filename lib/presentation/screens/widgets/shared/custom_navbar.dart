import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined), label: 'Categorias'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined), label: 'Favoritos'),
      ],
    );
  }
}
