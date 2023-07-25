import 'package:dio/dio.dart';
import 'package:peliculas/config/constants/app_environment.dart';
import 'package:peliculas/domain/datasource/movies_datasource.dart';
import 'package:peliculas/domain/entities/movie.dart';

class MovieDbDataSource extends MoviesDatasource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': AppEnvironment.apiKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _dio.get('/movie/now_playing');
    List<Movie> movies = response.data[1];
    return movies;
  }
}
