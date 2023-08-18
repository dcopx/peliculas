import 'package:dio/dio.dart';
import 'package:peliculas/config/constants/app_environment.dart';
import 'package:peliculas/domain/datasource/movies_datasource.dart';
import 'package:peliculas/domain/entities/movie.dart';
import 'package:peliculas/structure/mapper/movie_mapper.dart';

import '../models/moviedb/movie/moviedb_model_movie_detail.dart';
import '../models/moviedb/movie/moviedb_model_response.dart';

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

  List<Movie> _jsonToList(Map<String, dynamic> json) {
    final dataResponse = MovieDbModelResponse.fromJson(json);
    List<Movie> movies = dataResponse.results
        .where((movieDB) => movieDB.posterPath != 'no-poster')
        .map((movieDB) => MovieMapper.movieDbToEntity(movieDB))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await _dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _jsonToList(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await _dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToList(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await _dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToList(response.data);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
    final response =
        await _dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToList(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await _dio.get('/movie/$id');
    if (response.statusCode != 200) throw Exception();
    final movieDetail = MovieDetail.fromJson(response.data);
    final movie = MovieMapper.movieDbDetailToEntity(movieDetail);
    return movie;
  }

  @override
  Future<List<Movie>> searchMovie(String query) async {
    if (query.isEmpty) return [];

    final response =
        await _dio.get('/search/movie', queryParameters: {'query': query});
    return _jsonToList(response.data);
  }
}
