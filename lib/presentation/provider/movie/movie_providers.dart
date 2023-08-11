import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/presentation/provider/movie/movie_notifier.dart';
import 'package:peliculas/presentation/provider/provider_repository.dart';

import '../../../domain/entities/movie.dart';

final movieProvider =
    StateNotifierProvider<MovieNotifier, Map<String, Movie>>((ref) {
  final fetchMovie = ref.watch(moviesRepositoryProvider).getMovieById;
  return MovieNotifier(fetchMovie: fetchMovie);
});
