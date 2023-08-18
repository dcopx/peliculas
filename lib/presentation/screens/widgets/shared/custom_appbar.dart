import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:peliculas/presentation/delagates/search_delagate.dart';
import '../../../provider/search/search_provider.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              const Icon(Icons.movie_outlined),
              const SizedBox(width: 5),
              Text(
                'Peliculones',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search_off_outlined),
                onPressed: () {
                  final searchMovies = ref.read(searchMovieProvider);
                  final searchQuery = ref.read(searchQueryProvider);
                  showSearch(
                          query: searchQuery,
                          context: context,
                          delegate: MovieSearchDelagate(
                              searchMovies: ref
                                  .read(searchMovieProvider.notifier)
                                  .seachrMoviesByQuery,
                              initialData: searchMovies))
                      .then((movie) {
                    if (movie == null) return;
                    context.push('/movie/${movie.id}');
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
