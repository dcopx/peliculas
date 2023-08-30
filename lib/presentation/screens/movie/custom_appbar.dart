import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:peliculas/presentation/screens/widgets/shared/custom_gradient.dart';

import '../../../domain/entities/movie.dart';
import '../../provider/localdb/local_provider.dart';
import '../../provider/provider_repository.dart';

class MovieCustomAppBar extends ConsumerWidget {
  final Movie movie;
  const MovieCustomAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final isFavoriteCheck = ref.watch(existsFavorite(movie.id));
    return SliverAppBar(
      actions: [
        IconButton(
          icon: isFavoriteCheck.when(
            data: (data) => data
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border_outlined),
            error: (_, __) => throw UnimplementedError(),
            loading: () => const CircularProgressIndicator(),
          ),
          onPressed: () async {
            await ref.read(favoriteMovies.notifier).toggleFavorite(movie);
            ref.invalidate(existsFavorite(movie.id));
          },
        )
      ],
      foregroundColor: Colors.white,
      expandedHeight: screenSize.height * 0.7,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        title: Text(movie.title, style: const TextStyle(fontSize: 20)),
        background: Stack(children: [
          SizedBox.expand(
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
            ),
          ),
          const CustomGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1.0],
              colors: [Colors.transparent, Colors.black]),
          const CustomGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.2],
              colors: [Colors.black54, Colors.transparent]),
          const CustomGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              stops: [
                0.0,
                0.4
              ],
              colors: [
                Colors.black,
                Colors.transparent,
              ])
        ]),
      ),
    );
  }
}
