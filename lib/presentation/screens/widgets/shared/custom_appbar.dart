import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/presentation/delagates/search_delagate.dart';

import '../../../provider/provider_repository.dart';

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
                  final movieRepository = ref.read(moviesRepositoryProvider);
                  showSearch(
                      context: context,
                      delegate: MovieSearchDelagate(
                          searchMovies: movieRepository.searchMovie));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
