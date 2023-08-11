import 'package:peliculas/domain/datasource/actors_datasource.dart';
import 'package:peliculas/domain/entities/actor.dart';

import '../../domain/repository/actors_repository.dart';

class ActorsRepositoryImpl extends ActorsRepository {
  final ActorsDataSource datasource;

  ActorsRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorByMovieId(String id) {
    return datasource.getActorByMovieId(id);
  }
}
