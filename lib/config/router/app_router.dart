import 'package:go_router/go_router.dart';
import 'package:peliculas/presentation/screens/screens.dart';

import '../../presentation/screens/movie/movie_screen.dart';

final routes = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: MoviesScreen.name,
      builder: (context, state) => const MoviesScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? ':no-id';
            return MovieScreen(id: movieId);
          },
        ),
      ]),
]);
