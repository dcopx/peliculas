import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import '../screens/widgets/shared/custom_movie_item.dart';

typedef SearchMovieCallBack = Future<List<Movie>> Function(String query);

class MovieSearchDelagate extends SearchDelegate<Movie?> {
  final SearchMovieCallBack searchMovies;

  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  Timer? _debouncedTimer;

  MovieSearchDelagate({required this.searchMovies});

  void _onQueryChanged(String query) {
    if (_debouncedTimer?.isActive ?? false) _debouncedTimer!.cancel();

    _debouncedTimer = Timer(const Duration(seconds: 1), () async {
      if (query.isEmpty) {
        debouncedMovies.add([]);
        return;
      }

      final movies = await searchMovies(query);
      debouncedMovies.add(movies);
    });
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
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(movies[index].title),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return StreamBuilder(
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
}
