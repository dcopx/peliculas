import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/domain/entities/movie.dart';
import 'package:peliculas/domain/repository/local_repository.dart';

class LocalMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalRepository repository;

  LocalMoviesNotifier(this.repository) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await repository.loadMovies(offset: page * 10);
    page++;
    final tmpMoviesMap = <int, Movie>{};
    for (final movie in movies) {
      tmpMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tmpMoviesMap};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await repository.toggleFavorite(movie);
    bool isInFavorites = state[movie.id] != null;
    if (isInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
