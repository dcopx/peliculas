import 'package:flutter/material.dart';
import 'package:peliculas/presentation/screens/widgets/shared/custom_gradient.dart';

import '../../../domain/entities/movie.dart';

class MovieCustomAppBar extends StatelessWidget {
  final Movie movie;
  const MovieCustomAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SliverAppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border_outlined),
        )
      ],
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
          const CustomGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1.0],
              colors: [Colors.transparent, Colors.black]),
          const CustomGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.2],
              colors: [Colors.black54, Colors.transparent]),
          const CustomGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              stops: [
                0.0,
                0.4
              ],
              colors: [
                Colors.black,
                Colors.transparent,
              ])
        ]),
      ),
    );
  }
}
