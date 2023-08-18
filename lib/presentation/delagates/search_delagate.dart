import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import '../screens/widgets/shared/custom_movie_item.dart';

typedef SearchMovieCallBack = Future<List<Movie>> Function(String query);

class MovieSearchDelagate extends SearchDelegate<Movie?> {
  final SearchMovieCallBack searchMovies;
  List<Movie> initialData;

  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  Timer? _debouncedTimer;

  MovieSearchDelagate({required this.searchMovies, required this.initialData});

  void _onQueryChanged(String query) {
    if (_debouncedTimer?.isActive ?? false) _debouncedTimer!.cancel();

    _debouncedTimer = Timer(const Duration(seconds: 1), () async {
      final movies = await searchMovies(query);
      debouncedMovies.add(movies);
      initialData = movies;
    });
  }

  Widget _returnResults() {
    return StreamBuilder(
      initialData: initialData,
      stream: debouncedMovies.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return CustomMovieItem(
              movie: movies[index],
              onMovieSelected: (context, movie) {
                _disposeStreams();
                close(context, movie);
              },
            );
          },
        );
      },
    );
  }

  void _disposeStreams() {
    debouncedMovies.close();
  }

  @override
  String? get searchFieldLabel => 'Buscar películas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          _disposeStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return _returnResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return _returnResults();
  }
}
