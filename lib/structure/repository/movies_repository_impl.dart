import 'package:peliculas/domain/datasource/movies_datasource.dart';
import 'package:peliculas/domain/entities/movie.dart';
import 'package:peliculas/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
