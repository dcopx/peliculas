import 'package:dio/dio.dart';
import 'package:peliculas/domain/datasource/actors_datasource.dart';
import 'package:peliculas/domain/entities/actor.dart';
import 'package:peliculas/structure/mapper/actor_mapper.dart';

import '../../config/constants/app_environment.dart';
import '../models/moviedb/actor/moviedb_model_response.dart';

class ActorsDbDataSource extends ActorsDataSource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': AppEnvironment.apiKey,
        'language': 'es-MX',
      },
    ),
  );

  List<Actor> _jsonToList(Map<String, dynamic> json) {
    final dataResponse = MovieCreditResponse.fromJson(json);
    List<Actor> casts = dataResponse.cast
        .map((e) => ActorMapper.actorMovieDbToEntity(e))
        .toList();
    return casts;
  }

  @override
  Future<List<Actor>> getActorByMovieId(String id) async {
    final response = await _dio.get('/movie/$id/credits');
    return _jsonToList(response.data);
  }
}
