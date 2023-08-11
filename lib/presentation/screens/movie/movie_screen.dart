import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/presentation/provider/movie/movie_providers.dart';
import 'package:peliculas/presentation/screens/movie/custom_appbar.dart';
import 'package:peliculas/presentation/screens/movie/movie_body.dart';

import '../../../domain/entities/movie.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';
  final String id;
  const MovieScreen({super.key, required this.id});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieProvider.notifier).loadMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieProvider)[widget.id];

    if (movie == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MovieCustomAppBar(movie: movie),
          MovieBody(movie: movie),
        ],
      ),
    );
  }
}
