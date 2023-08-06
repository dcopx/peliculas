import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

typedef MovieCallBack = Future<Movie> Function(String id);

class MovieNotifier extends StateNotifier<Map<String, Movie>> {
  final MovieCallBack fetchMovie;

  MovieNotifier({required this.fetchMovie}) : super({});

  Future<void> loadMovie(String id) async {
    if (state[id] != null) return;

    final movie = await fetchMovie(id);
    state = {...state, id: movie};
  }
}
