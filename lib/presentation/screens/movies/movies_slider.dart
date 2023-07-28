import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../../domain/entities/movie.dart';

class MoviesSlider extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        autoplay: true,
        viewportFraction: 0.8,
        scale: 0.9,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return _MovieCardSlider(movie: movies[index]);
        },
      ),
    );
  }
}

class _MovieCardSlider extends StatelessWidget {
  final Movie movie;

  const _MovieCardSlider({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 9),
              blurRadius: 10,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
