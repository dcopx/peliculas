import '../entities/movie.dart';

abstract class LocalRepository {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isFavorite(int id);
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
