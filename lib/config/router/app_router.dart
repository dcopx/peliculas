import 'package:go_router/go_router.dart';
import 'package:peliculas/presentation/screens/home_screen.dart';

import '../../presentation/screens/movie/movie_screen.dart';

final routes = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final index = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(indexPage: index);
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? ':no-id';
            return MovieScreen(id: movieId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    )
  ],
);
