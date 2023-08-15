import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/movie.dart';

class CustomMovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;
  const CustomMovieItem(
      {super.key, required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.2,
              height: size.height * 0.125,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    movie.posterPath,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: size.width * 0.70,
              height: size.height * 0.125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.titleLarge),
                  Text(movie.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.bodyMedium)
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        onMovieSelected(context, movie);
      },
    );
  }
}
