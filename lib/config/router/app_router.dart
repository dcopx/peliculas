import 'package:go_router/go_router.dart';
import 'package:peliculas/presentation/screens/screens.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: MovieScreen.name,
    builder: (context, state) => const MovieScreen(),
  ),
]);
