import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/presentation/provider/search/search_provider.dart';

import '../../../domain/entities/movie.dart';

typedef SearchCallBack = Future<List<Movie>> Function(String query);

class SearchNotifier extends StateNotifier<List<Movie>> {
  final SearchCallBack searchMovies;
  final Ref ref;

  SearchNotifier({required this.searchMovies, required this.ref}) : super([]);

  Future<List<Movie>> seachrMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
