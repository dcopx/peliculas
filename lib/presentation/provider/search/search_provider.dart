import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/presentation/provider/provider_repository.dart';
import 'package:peliculas/presentation/provider/search/search_notifier.dart';

import '../../../domain/entities/movie.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchMovieProvider =
    StateNotifierProvider<SearchNotifier, List<Movie>>((ref) {
  final movieReporsitory = ref.read(moviesRepositoryProvider);
  return SearchNotifier(searchMovies: movieReporsitory.searchMovie, ref: ref);
});
