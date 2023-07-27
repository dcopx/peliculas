import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/domain/entities/movie.dart';
import 'package:peliculas/presentation/provider/movie/movies_notifier.dart';
import 'package:peliculas/presentation/provider/movie/movies_repositoy_provider.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});
