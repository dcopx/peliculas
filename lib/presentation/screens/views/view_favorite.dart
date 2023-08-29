import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:peliculas/presentation/screens/favorite/favorite_body.dart';
import 'package:peliculas/presentation/screens/widgets/shared/custom_movie_card.dart';
import 'package:peliculas/presentation/screens/widgets/shared/custom_movie_item.dart';

import '../../../domain/entities/movie.dart';
import '../../provider/localdb/local_provider.dart';

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
  ConsumerState<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends ConsumerState<FavoriteView> {
  bool isLoading = false;
  bool isFinalPage = false;

  void loadNextPage() async {
    if (isLoading || isFinalPage) return;
    isLoading = true;
    final movies = await ref.read(favoriteMovies.notifier).loadNextPage();
    isLoading = false;
    if (movies.isEmpty) {
      isFinalPage = true;
    }
  }

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(favoriteMovies).values.toList();

    // return ListView.builder(
    //   itemCount: movies.length,
    //   itemBuilder: (context, index) {
    //     final Movie movie = movies[index];
    //     return ListTile(
    //       title: Text(movie.title),
    //     );
    //   },
    // );
    return FavoritesBody(
      movies: movies,
      callBack: loadNextPage,
    );
  }
}
