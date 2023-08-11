import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MovieCustomAppBar extends StatelessWidget {
  final Movie movie;
  const MovieCustomAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SliverAppBar(
      foregroundColor: Colors.white,
      expandedHeight: screenSize.height * 0.7,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        title: Text(movie.title, style: const TextStyle(fontSize: 20)),
        background: Stack(children: [
          SizedBox.expand(
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: [0.7, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black]),
              ),
            ),
          ),
          const SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: [0.0, 0.4],
                    begin: Alignment.topLeft,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
