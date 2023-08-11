import 'package:flutter/material.dart';
import 'package:peliculas/domain/entities/movie.dart';
import 'package:peliculas/presentation/screens/movie/actors_listview.dart';

class MovieBody extends StatelessWidget {
  final Movie movie;
  const MovieBody({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (context, index) => _MovieBody(movie),
      ),
    );
  }
}

class _MovieBody extends StatelessWidget {
  final Movie movie;
  const _MovieBody(this.movie);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                    width: screenSize.width * 0.3,
                    child: Image.network(
                      movie.posterPath,
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: (screenSize.width * 0.7) - 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title, style: textTheme.titleLarge),
                    Text(movie.overview, maxLines: 10),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Wrap(
            children: [
              ...movie.genreIds.map(
                (genero) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Chip(label: Text(genero)),
                ),
              ),
            ],
          ),
          ActorsListView(id: movie.id)
        ],
      ),
    );
  }
}
