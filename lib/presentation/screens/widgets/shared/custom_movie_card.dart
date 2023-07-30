import 'package:flutter/material.dart';
import 'package:peliculas/config/helpers/app_format_number.dart';
import '../../../../domain/entities/movie.dart';

class CustomMovieCard extends StatelessWidget {
  final Movie movie;
  const CustomMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: (movie.posterPath != 'no-poster')
                  ? Image.network(movie.posterPath, fit: BoxFit.cover)
                  : Image.asset('assets/images/no-poster.jpg',
                      fit: BoxFit.cover)),
          Text(
            movie.title,
            style: textTheme.titleSmall,
            maxLines: 2,
          ),
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                const SizedBox(width: 3),
                Text('${movie.voteAverage}',
                    style: textTheme.labelMedium!
                        .copyWith(color: Colors.yellow.shade800)),
                const Spacer(),
                Text(AppFormatData().numeroResumido(movie.popularity),
                    style: textTheme.labelMedium)
              ],
            ),
          )
        ],
      ),
    );
  }
}
