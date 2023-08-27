import 'package:peliculas/domain/entities/movie.dart';
import 'package:peliculas/domain/repository/local_repository.dart';
import 'package:peliculas/structure/datasource/isar_local_datasource.dart';

class LocalRepositoryImpl extends LocalRepository {
  final IsarLocalDataSource dataSource;

  LocalRepositoryImpl(this.dataSource);

  @override
  Future<bool> isFavorite(int id) {
    return dataSource.isFavorite(id);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return dataSource.loadMovies();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return dataSource.toggleFavorite(movie);
  }
}
