import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../../domain/entities/movie.dart';

class MoviesSlider extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colorActivo = Theme.of(context).primaryColor;
    final colorPuntos = Theme.of(context).hoverColor;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
              activeColor: colorActivo, color: colorPuntos),
        ),
        autoplay: true,
        viewportFraction: 0.8,
        scale: 0.9,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          if (movies.isEmpty) return const CircularProgressIndicator();
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
      padding: const EdgeInsets.only(bottom: 20),
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
