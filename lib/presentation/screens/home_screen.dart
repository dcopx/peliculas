import 'package:flutter/material.dart';
import 'package:peliculas/presentation/screens/views/view_favorite.dart';
import 'package:peliculas/presentation/screens/views/view_home.dart';

import 'widgets/shared/custom_navbar.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  static const viewRoutes = <Widget>[HomeView(), SizedBox(), FavoriteView()];
  final int indexPage;

  const HomeScreen({super.key, required this.indexPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: indexPage, children: viewRoutes),
      bottomNavigationBar: CustomNavBar(pageIndex: indexPage),
    );
  }
}
