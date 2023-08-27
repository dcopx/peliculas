import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/domain/entities/movie.dart';
import 'package:peliculas/domain/repository/local_repository.dart';

class LocalMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalRepository repository;

  LocalMoviesNotifier(this.repository) : super({});

  Future<void> loadNextPage() async {
    final movies = await repository.loadMovies(offset: page * 10);
    page++;
    final tmpMoviesMap = <int, Movie>{};
    for (final movie in movies) {
      tmpMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tmpMoviesMap};
  }
}
