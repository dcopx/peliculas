import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/presentation/screens/favorite/favorite_body.dart';

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

    if (movies.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_outlined, size: 40),
            Text('No hay favoritos',
                style: TextStyle(color: Colors.red, fontSize: 30))
          ],
        ),
      );
    }
    return FavoritesBody(
      movies: movies,
      callBack: loadNextPage,
    );
  }
}
