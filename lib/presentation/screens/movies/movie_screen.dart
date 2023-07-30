import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peliculas/presentation/provider/movie/movies_providers.dart';
import 'package:peliculas/presentation/screens/movies/movies_listview.dart';
import 'package:peliculas/presentation/screens/movies/movies_slider.dart';
import 'package:peliculas/presentation/screens/widgets/shared/custom_appbar.dart';

import '../widgets/shared/custom_navbar.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'movie-screen';

  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingPrincipal = ref.watch(principalNowPlayingProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlider(movies: nowPlayingPrincipal),
                MoviesListWiew(
                  title: 'En cines',
                  dateTitle: 'Lun 20',
                  movies: nowPlayingMovies,
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MoviesListWiew(
                  title: 'Populares',
                  movies: popularMovies,
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MoviesListWiew(
                  title: 'Recomendadas',
                  dateTitle: 'Las mejores',
                  movies: topRatedMovies,
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MoviesListWiew(
                  title: 'Por Estrenarse',
                  dateTitle: 'Ya vienen',
                  movies: upComingMovies,
                  loadNextPage: () {
                    ref.read(upComingMoviesProvider.notifier).loadNextPage();
                  },
                ),
              ],
            );
          }, childCount: 1),
        )
      ],
    );
  }
}
