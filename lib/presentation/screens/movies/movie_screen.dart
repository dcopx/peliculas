import 'package:flutter/material.dart';
import 'package:peliculas/config/constants/app_environment.dart';
import 'package:peliculas/structure/moviedb_datasource.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'movie-screen';

  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: MovieDbDataSource().getNowPlaying(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        final peliculas = snapshot.data;

        return Text(peliculas![1].title);
      },
    ));
  }
}
