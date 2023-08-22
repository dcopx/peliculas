import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatelessWidget {
  final int pageIndex;

  const CustomNavBar({super.key, required this.pageIndex});

  int _getCurrentIndex(BuildContext context) {
    String location = GoRouterState.of(context).location;
    switch (location) {
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;
      default:
        return 0;
    }
  }

  void _onItemTapped(BuildContext context, int value) {
    switch (value) {
      case 0:
        context.go('/home/0');
      case 1:
        context.go('/home/1');
      case 2:
        context.go('/home/2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: pageIndex, //_getCurrentIndex(context),
      onTap: (value) => _onItemTapped(context, value),
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
