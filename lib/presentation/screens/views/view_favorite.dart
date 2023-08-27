import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';
import '../../provider/localdb/local_provider.dart';

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
  ConsumerState<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends ConsumerState<FavoriteView> {
  @override
  void initState() {
    super.initState();
    ref.read(favoriteMovies.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(favoriteMovies).values.toList();

    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final Movie movie = movies[index];
        return ListTile(
          title: Text(movie.title),
        );
      },
    );
  }
}
